package klasse;


typedef Sammlung = {
    klasse:Kreatur,
    dyn:KlasseDynamisch,
    inv:Inventar
}

class KampfZustand
{

    public var klasse1:Kreatur;
    public var klasse2:Kreatur;    
    public var dyn1:KlasseDynamisch; 
    public var dyn2:KlasseDynamisch;  
    public var inv1:Inventar;
    public var inv2:Inventar;

    public var sammlung:Array<Sammlung>;

    public var zug:Int;
    public var ausgewaehltesabteil:Int;
    
    public var faehigkeiten:Array<Faehigkeit>;

    public var schadenp1:Float;
    public var schadenp2:Float;
    public var zuHaufen1:Array<HaufenPlacement>;
    public var zuHaufen2:Array<HaufenPlacement>;
    public var wein1:Bool=false;
    public var wein2:Bool=false;

    public var aitrigger:Bool=true;

    public function new(klasse1:Kreatur,klasse2:Kreatur,dyn1:KlasseDynamisch,dyn2:KlasseDynamisch){
        
        this.klasse1=klasse1;
        this.klasse2=klasse2;
        this.dyn1=dyn1;
        this.dyn2=dyn2;
        inv1 = new Inventar(klasse1,dyn1,0);
        inv2 = new Inventar(klasse2,dyn2,1);

        zug=0;
        ausgewaehltesabteil=-1;

        faehigkeiten = new Array<Faehigkeit>();

        schadenp1=-1;
        schadenp2=-1;

        zuHaufen1 = new Array<HaufenPlacement>();
        zuHaufen2 = new Array<HaufenPlacement>();
        
        sammlung = [
            {
                klasse:klasse1,
                dyn:dyn1,
                inv:inv1
            },
            {
                klasse:klasse2,
                dyn:dyn2,
                inv:inv2
            },
        ];

    }

    private function mischenHaufenInSchlange() {
        var inv = zug== 0 ? inv1 : inv2;
        if (inv.haufen.length==0){
            return;
        }
        Random.shuffle(inv.haufen);
        for (item in inv.haufen){
            inv.schlange.push(item.dyn);
            item.sprite.destroy();
            //TODO:EINRAEUMEN ANIMATION
        }        
        inv.haufen.splice(0,inv.haufen.length);
    }
    
    private function werfAlleKartenWeg() {
        var inv = zug==0 ? inv1 : inv2;

        var gestellteRuestung = inv.placed.map(
            function(p:Placement){
                return p.ruestung;
                }
            );
            
        for (r in gestellteRuestung){
            wegwerf(zug,r);
        }
    }

    public function beginnZug(){
        
        for (f in faehigkeiten){
            trace(Type.getClass(f));
            f.zugbeginn(zug);  
        }
    }


    public function endZug(){
        for (f in faehigkeiten){
            trace(Type.getClass(f));
            f.zugend(zug);  
        }

        werfAlleKartenWeg();
        
		ausgewaehltesabteil=-1;
        zug=1-zug;
        
        for (f in faehigkeiten){
            trace(Type.getClass(f));
            f.zugbeginn(zug);  
        }
        
        beginnZug();
    }

    public function placePiece(mc:Dynamic){       
		var inv:Inventar = zug==0?inv1:inv2;
        
		var ruestungIndex = ausgewaehltesabteil;
		var ruesetungdyn = inv.schlange[ruestungIndex];
		inv.schlange.splice(ruestungIndex,1);
		ausgewaehltesabteil=-1;
        var p:Placement = {
							ruestung: ruesetungdyn,
							x:mc.x,
							y:mc.y,
                            sprite:null
							};
		inv.placed.push(p);

        var s = ruesetungdyn.ruestung.skript;        
        var tokens = s.split(" ");        
        var classname = "faehigkeit."+tokens[0];
        var args:Array<Dynamic> = [zug,ruesetungdyn,this];
        for (i in 1...tokens.length){
            args.push(Std.parseInt(tokens[i]) );
        }
        var class_type = Type.resolveClass(classname);

        if (inv.schlange.length==0 && inv.haufen.length>0){
            mischenHaufenInSchlange();
        }
        
      //  var a =  faehigkeit.Schaeden;
      //  var a = new faehigkeit.Schaeden(9,null,null,0);
        var class_instance:Faehigkeit = Type.createInstance(class_type,args);
        faehigkeiten.push(class_instance);  

        class_instance.selbstplatzierung(p);
    }

    public function heilen(spieler:Int,amount:Int){
        if(spieler==0){            
            dyn1.gesundheit+=amount;
            if (dyn1.gesundheit>dyn1.maxGesundheit){
                dyn1.gesundheit=dyn1.maxGesundheit;
            }
        } else {
            dyn2.gesundheit+=amount;
            if (dyn2.gesundheit>dyn2.maxGesundheit){
                dyn2.gesundheit=dyn2.maxGesundheit;
            }
        }
    }

    public function schaeden(spieler:Int,amount:Int) {
        for (f in faehigkeiten){
            amount = f.vorSchaedenErleiden(spieler,amount);  
        }

        if(spieler==0){
            schadenp1 = dyn1.gesundheit;
            dyn1.gesundheit-=amount;
            if (dyn1.gesundheit<=0){
                wein1=true;
                dyn1.gesundheit=0;
            }
        } else {
            schadenp2 = dyn2.gesundheit;
            dyn2.gesundheit-=amount;
            if (dyn2.gesundheit<=0){
                wein2=true;
                dyn2.gesundheit=0;
            }
        }
    }

    public function wegwerf(spieler:Int,dyn:RuestungDynamisch){
        var inv = spieler==0?inv1:inv2;
        for (i in 0...inv.placed.length) {
            var p = inv.placed[i];
            if (dyn==p.ruestung){    
                if (p.sprite!=null){
                    if (spieler==0){
                        zuHaufen1.push(new HaufenPlacement(p.ruestung,p.sprite));
                    } else {
                        zuHaufen2.push(new HaufenPlacement(p.ruestung,p.sprite));

                    }  
                }
                inv.placed.splice(i,1);
                inv.haufen.push(new HaufenPlacement(p.ruestung,p.sprite));
                break;
            }
        }

        var i = faehigkeiten.length;
        while (--i>=0) {
            var f = faehigkeiten[i];
            if (f.dyn == dyn){
                faehigkeiten.splice(i,1);
            }
        }

        for (f in faehigkeiten){
            f.nachRuestungWegwerfen();  
        }
    }
}
