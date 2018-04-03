package klasse;

import utils.*;

class Klasse
{
    public var name:String;
    public var druckname:StringPair;
    public var bild:String;
    public var spielbar:Bool;
    public var beschreibung:StringPair;

    public function new(
        _name:String,
        _druckname:StringPair,
        _bild:String,
        _spielbar:Bool,
        _beschreibung:StringPair
    ){
        this.name=_name;
        this.druckname=_druckname;
        this.bild=_bild;
        this.spielbar=_spielbar;
        this.beschreibung=_beschreibung;
    }
}