package ort;

class OberweltData
{
    public var dat : Array<Array<Dynamic>>;

    private function KlassenFuerOrt(ort:Ort) : Array<Klasse> {        
        return Kreaturen.filter( function(k:Klasse) { return k.ort == ort.name; } );       
    }


	public function visibleTile(i:Int,j:Int):Bool {
		if (i>0 && dat[i-1][j]==null){
			return true;
		}
		if (i<dat.length-1 && dat[i+1][j]==null){
			return true;
		}
		if (j>0 && dat[i][j-1]==null){
			return true;
		}
		if (j<dat[0].length-1 && dat[i][j+1]==null){
			return true;
		}
		return false;
	}

    public function new(ort:Ort){
        var moeglichKreaturen:Array<Klasse> = KlassenFuerOrt(ort);
        
        dat = new Array<Array<Dynamic>>();
        for (i in 0...CONST.invW){
            var col = new Array<Dynamic>();
            for (j in 0...CONST.invH){   
                var rk:Klasse = Random.pick(moeglichKreaturen);
                var e = {
                    name : rk.name,
                    bild : rk.bild,
                };
                col.push(e);
            }
            dat.push(col);
        }
    }
}