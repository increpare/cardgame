package klasse;

class KampfZustand
{
    public var klasse1:Klasse;
    public var klasse2:Klasse;    
    public var dyn1:KlasseDynamisch; 
    public var dyn2:KlasseDynamisch;  
    
    public var zug:Int;

    public var RuestungSchlange1:Array<String>;
    public var RuestungSchlange2:Array<String>;

    public var MullHaufen1:Array<String>;
    public var MullHaufen2:Array<String>;

    public function new(klasse1:Klasse,klasse2:Klasse,dyn1:KlasseDynamisch,dyn2:KlasseDynamisch,){
        this.klasse1=klasse1;
        this.klasse2=klasse2;
        this.dyn1=dyn1;
        this.dyn2=dyn2;
    }
}
