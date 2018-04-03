package klasse;

import utils.*;

class Ruestung
{
    public var name:String;
    public var bild:String;
    public var druckname:StringPair;
    public var beschreibung:StringPair;
    public var form:Array<Array<Int>>;
    public var onplay:String;
    public var bleibend:Bool;
    

    public function new(
        _name:String,
        _bild:String,
        _druckname:StringPair,
        _beschreibung:StringPair,
        _form:Array<Array<Int>>,
        _onplay:String,
        _bleibend:Bool
    ){
        this.name=_name;
        this.bild=_bild;
        this.druckname=_druckname;
        this.beschreibung=_beschreibung;
        this.form=_form;
        this.onplay=_onplay;
        this.bleibend=_bleibend;
    }
}