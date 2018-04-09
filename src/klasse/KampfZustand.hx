package klasse;


class KampfZustand
{

    public var klasse1:Kreatur;
    public var klasse2:Kreatur;    
    public var dyn1:KlasseDynamisch; 
    public var dyn2:KlasseDynamisch;  
    
    public var zug:Int;
    public var ausgewaehltesabteil:Int;

    public var inv1:Inventar;
    public var inv2:Inventar;

    public var faehigkeiten:Array<Faehigkeit>;

    public var schadenp1:Float;
    public var schadenp2:Float;
    public var toHaufen1:Array<SpriteManager.Sprite>;
    public var toHaufen2:Array<SpriteManager.Sprite>;

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

        toHaufen1 = new Array<SpriteManager.Sprite>();
        toHaufen2 = new Array<SpriteManager.Sprite>();
        

    }

    private function mischenHaufenInSchlange() {
        var inv = zug== 0 ? inv1 : inv2;
        if (inv.haufen.length==0){
            return;
        }
        Random.shuffle(inv.haufen);
        inv.schlange = inv.schlange.concat(inv.haufen);
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
        } else {
            dyn2.gesundheit+=amount;
        }
    }

    public function schaeden(spieler:Int,amount:Int) {
        for (f in faehigkeiten){
            trace(Type.getClass(f));
            amount = f.vorSchaedenErleiden(spieler,amount);  
        }

        if(spieler==0){
            schadenp1 = dyn1.gesundheit;
            dyn1.gesundheit-=amount;
        } else {
            schadenp2 = dyn2.gesundheit;
            dyn2.gesundheit-=amount;
        }
    }

    public function wegwerf(spieler:Int,dyn:RuestungDynamisch){
        var inv = spieler==0?inv1:inv2;
        for (i in 0...inv.placed.length) {
            var p = inv.placed[i];
            if (dyn==p.ruestung){    
                if (p.sprite!=null){
                    if (spieler==0){
                        toHaufen1.push(p.sprite);
                    } else {
                        toHaufen2.push(p.sprite);
                    }  
                }
                inv.placed.splice(i,1);
                inv.haufen.push(dyn);
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
