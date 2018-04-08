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

    public function new(klasse1:Kreatur,klasse2:Kreatur,dyn1:KlasseDynamisch,dyn2:KlasseDynamisch){
        this.klasse1=klasse1;
        this.klasse2=klasse2;
        this.dyn1=dyn1;
        this.dyn2=dyn2;
        inv1 = new Inventar(klasse1,dyn1,0);
        inv2 = new Inventar(klasse2,dyn2,1);

        zug=0;
        ausgewaehltesabteil=-1;
    }

    public function placePiece(mc:Dynamic){
		var inv:Inventar = zug==0?inv1:inv2;
		var ruestungIndex = ausgewaehltesabteil;
		var ruesetungdyn = inv.schlange[ruestungIndex];
		inv.schlange.splice(ruestungIndex,1);
		ausgewaehltesabteil=-1;
		inv.placed.push({
							ruestung: ruesetungdyn,
							x:mc.x,
							y:mc.y
							});

        
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
            amount = f.vorSchaedenErleiden(spieler,amount);  
        }

        if(spieler==0){
            dyn1.gesundheit-=amount;
        } else {
            dyn2.gesundheit-=amount;
        }
    }

    public function wegwerf(spieler:Int,dyn:RuestungDynamisch){
        var targetInventar = spieler==0?inv1:inv2;
        for (i in 0...targetInventar.placed.length) {
            var p = targetInventar.placed[i];
            if (dyn==p.ruestung){                
                targetInventar.placed.splice(i,1);
                targetInventar.haufen.push(dyn);
                break;
            }
        }

        for (i in 0...faehigkeiten.length) {
            var f = faehigkeiten[i];
            if (f.dyn == dyn){
                targetInventar.placed.splice(i,1);
            }
        }

        for (f in faehigkeiten){
            f.nachRuestungWegwerfen();  
        }
    }
}
