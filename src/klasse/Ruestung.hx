package klasse;

class Ruestung
{
    public var name:String;
    public var bild:String;
    public var druckname:StringPair;
    public var beschreibung:StringPair;
    public var form:Array<Array<Int>>;
    public var onplay:String;
    public var bleibend:Bool;
    public var w:Int;
    public var h:Int;
    

    public function new(
        _name:String,
        _bild:String,
        _druckname:StringPair,
        _beschreibung:StringPair,
        _form:String,
        _onplay:String,
        _bleibend:Bool
    ){
        this.name=_name;
        this.bild=_bild;
        this.druckname=_druckname;
        this.beschreibung=_beschreibung;
        //this.form=_form;
        var formzeilen = _form.split("_");
        w = formzeilen[0].length;
        h = formzeilen.length;
        this.form = new Array<Array<Int>>();
        for (i in 0...w){
            var spalte = new Array<Int>();
            for (j in 0...h){
                 if (formzeilen[j].charAt(i)=="1"){
                     spalte.push(1);
                 } else {
                     spalte.push(0);
                 }
            }
            form.push(spalte);
        }
        
        this.onplay=_onplay;
        this.bleibend=_bleibend;
    }
}