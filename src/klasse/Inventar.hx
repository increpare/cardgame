package klasse;

typedef Placement = {
    var x : Int;
    var y : Int;
    var r : String;
};

class Inventar
{
    public var klasse:Klasse;
    public var dyn:KlasseDynamisch;

    public var schlange:List<String>;
    public var haufen:List<String>;
    public var aktiv:String;
    public var placed:Array<Placement>;

    public new(klasse:Klasse,dyn:KlasseDynamisch){
        this.klasse=klasse;
        this.dyn=dyn;

        schlange = new(dyn.ruestung);
        haufen = new();
        aktiv = new();
        placed = new();
    }
}
