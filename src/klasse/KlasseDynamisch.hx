package klasse;

class KlasseDynamisch
{
    public var klasse:Klasse;
    public var gesundheit:Int;
    public var maxGesundheit:Int;

    public var ruestung:Array<String>;

    public var platz:Array<Array<Bool>>;

    public function new(klasse:Klasse,gesundheit:Int,maxGesundheit:Int,ruestung:Array<String>){
        this.klasse=klasse;
        this.gesundheit=gesundheit;
        this.maxGesundheit=maxGesundheit;
        this.ruestung=ruestung;

        platz = new Array<Array<Bool>>();
        for (i in 0...CONST.invW){
            var col = new Array<Bool>();
            for (j in 0...CONST.invH){
                col.push(false);
            }
            platz.push(col);
        }   
        MakeHole(); 
    }

    public function MakeHole(){
        var holedesc = klasse.lagerplatz;
        var h = holedesc.split(" ");
        
        var fnname = h[0];
        var params = h.slice(1).map( function(s:String) { return Std.parseFloat(s); } );
        trace("calling "+h);
        trace("calling "+fnname +" : " + params);
        var fn = Reflect.field(this, h[0]);
        Reflect.callMethod(this, fn, params);
    }

    @:keep
    public function Rechteck(w:Int, h:Int){
        trace("RECHTECK "+w+" "+h);
        var ox = Math.floor((CONST.invW-w)/2);
        var oy = Math.floor((CONST.invH-h)/2);
        for (i in 0...w){
            var x = ox+i;
            trace("x = " +x);
            if (x<0 || x>=CONST.invW){
                continue;
            }
            for (j in 0...h){
                var y = oy+j;
                trace("y = " +y);
                if (y<0 || y>=CONST.invH){
                    continue;
                }
                trace(i+","+j);
                platz[x][y]=true;
            }
        }
        
    }

    @:keep
    public function Kreis(r:Float){
        var cx = CONST.invW/2;
        var cy = CONST.invH/2;
        for (i in 0...CONST.invW){
            for (j in 0...CONST.invH){
                var dx = i-cx;
                var dy = j-cy;
                if (dx*dx+dy*dy<=r*r+0.001){
                    platz[i][j]=true;
                }                
            }
        }
    }

}
