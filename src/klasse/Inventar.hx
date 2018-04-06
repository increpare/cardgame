package klasse;


class Inventar
{
    public var klasse:Kreatur;
    public var dyn:KlasseDynamisch;

    public var schlange:Array<RuestungDynamisch>;
    public var haufen:Array<RuestungDynamisch>;
    public var placed:Array<Placement>;

    public var spieler:Int;

    public function new(klasse:Kreatur,dyn:KlasseDynamisch, spieler:Int){
        this.klasse=klasse;
        this.dyn=dyn;
        this.spieler=spieler;
        
        var schlangenames = Random.shuffle(dyn.ruestung.copy());
        schlange = new Array<RuestungDynamisch>();
        for (i in 0...schlangenames.length){
            var n = schlangenames[i];
            var r = RuestungenDictionary[n];
            var rd:RuestungDynamisch = new RuestungDynamisch(r,Random.int(0,3));
            schlange.push(rd);
        }

        haufen = new Array<RuestungDynamisch>();
        placed = new Array<Placement>();
    }
}
