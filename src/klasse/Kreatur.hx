package klasse;

class Kreatur
{
    public var name(default, null):String;
    public var augen(default, null):Array<IntPair>;
    public var ort(default, null):String;
    public var druckname(default, null):StringPair;
    public var bild(default, null):String;
    public var spielbar(default, null):Bool;
    public var stufe(default, null):Int;
    public var lagerplatz(default, null):String;
    public var beschreibung(default, null):StringPair;
    public var gesundheit(default, null):Int;
    public var sichtbareslot(default, null):Int;
    public var ruestung(default, null):Array<String>;

    public function new(
        _name:String,
        _augen:Array<IntPair>,
        _ort:String,
        _druckname:StringPair,
        _bild:String,
        _spielbar:Bool,
        _stufe:Int,
        _lagerplatz:String,
        _beschreibung:StringPair,
        _gesundheit:Int,
        _sichtbareslot:Int,
        _ruestung:Array<String>
    ){
        name=_name;
        augen=_augen;
        ort=_ort;
        druckname=_druckname;
        bild=_bild;
        spielbar=_spielbar;
        stufe=_stufe;
        lagerplatz=_lagerplatz;        
        beschreibung=_beschreibung;
        gesundheit=_gesundheit;
        sichtbareslot=_sichtbareslot;
        ruestung=_ruestung;

    }
}