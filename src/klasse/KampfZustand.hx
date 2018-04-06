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
}
