package klasse;

class Ruestung
{
    public var name:String;
    public var druckname:StringPair;
    public var beschreibung:StringPair;

    public var bild:Array<String>;
    public var form:Array<Array<Array<Int>>>;

    public var onplay:String;
    public var bleibend:Bool;
    public var w:Array<Int>;
    public var h:Array<Int>;
    
    public function copy():Ruestung{
        var r = new Ruestung(name,bild[0],druckname,beschreibung,"",onplay,bleibend);
        r.form=this.form;//doesn't deep copy the form, but this should normally be ok.
        return r;
    }

    private function generierRotation(basename:String,rot:Int){
        var w = Gfx.imagewidth(basename);
        var h = Gfx.imageheight(basename);

        var bw=w;
        var bh=h;

        if (rot%2==1){
            var t = w;
            w=h;
            h=t;
        }

        var imagename=basename+"__"+rot;
        Gfx.createimage(imagename,w,h);
        
        Gfx.rotation(90*rot,bw/2,bh/2);
        Gfx.drawtoimage(imagename);
        Gfx.drawimage(w/2-bw/2,h/2-bh/2,basename);
        Gfx.drawtoscreen();
        Gfx.rotation(0);
    }

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
        this.bild=new Array<String>();
        this.bild.push(_bild);
        this.bild.push(_bild+"__1");
        this.bild.push(_bild+"__2");
        this.bild.push(_bild+"__3");
        
        generierRotation(_bild,1);
        generierRotation(_bild,2);
        generierRotation(_bild,3);

        this.druckname=_druckname;
        this.beschreibung=_beschreibung;
        //this.form=_form;

        var formzeilen = _form.split("_");

        var iw = formzeilen[0].length;
        var ih = formzeilen.length;

        w = [iw,ih,iw,ih];
        h = [ih,iw,ih,iw];
        
        if(_form!=""){
            var form0 = new Array<Array<Int>>();
            var form1 = new Array<Array<Int>>();
            var form2 = new Array<Array<Int>>();
            var form3 = new Array<Array<Int>>();
            for (i in 0...iw){
                var spalte = new Array<Int>();
                for (j in 0...ih){
                    if (formzeilen[j].charAt(i)=="1"){
                        spalte.push(1);
                    } else {
                        spalte.push(0);
                    }
                }
                form0.push(spalte);
                var r = spalte.copy();
                r.reverse();
                form2.push(r);
            }
            form2.reverse();


            for (j in 0...ih){
                var zeile = new Array<Int>();
                for (i in 0...iw){
                    if (formzeilen[j].charAt(i)=="1"){
                        zeile.push(1);
                    } else {
                        zeile.push(0);
                    }
                }
                form1.push(zeile);
                var r = zeile.copy();
                r.reverse();
                form3.push(r);
            }
            form1.reverse();

            form = [form0,form1,form2,form3];
        }

        
        this.onplay=_onplay;
        this.bleibend=_bleibend;
    }
}