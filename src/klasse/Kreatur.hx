package klasse;

class Kreatur
{
    public var name:String;
    public var ort:String;
    public var druckname:StringPair;
    public var bild:String;
    public var spielbar:Bool;
    public var stufe:Int;
    public var lagerplatz:String;
    public var beschreibung:StringPair;
    public var gesundheit:Int;
    public var sichtbareslot:Int;
    public var ruestung:Array<String>;
    
    public function new(
        _name:String,
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