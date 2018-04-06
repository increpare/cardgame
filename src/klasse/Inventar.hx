package klasse;

typedef Placement = {
    var name : String;
    var x : Int;
    var y : Int;
    var rot : Int;
};

class Inventar
{
    public var klasse:Kreatur;
    public var dyn:KlasseDynamisch;

    public var schlange:Array<String>;
    public var haufen:Array<String>;
    public var aktiv:String;
    public var placed:Array<Placement>;

    public var spieler:Int;

    public function new(klasse:Kreatur,dyn:KlasseDynamisch, spieler:Int){
        this.klasse=klasse;
        this.dyn=dyn;
        this.spieler=spieler;
        
        schlange = dyn.ruestung.copy();
        haufen = new Array<String>();
        aktiv = "";
        placed = new Array<Placement>();
    }
}
