package ort;

class OberweltData
{
    public var dat : Array<Array<Kreatur>>;

    private function KreaturenFuerOrt(ort:Ort) : Array<Kreatur> {        
        return Kreaturen.filter( function(k:Kreatur) { return k.ort == ort.name; } );       
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
        var moeglichKreaturen:Array<Kreatur> = KreaturenFuerOrt(ort);
        
        dat = new Array<Array<Kreatur>>();
        for (i in 0...CONST.invW){
            var col = new Array<Kreatur>();
            for (j in 0...CONST.invH){   
                var rk:Kreatur = Random.pick(moeglichKreaturen);
                col.push(rk);
            }
            dat.push(col);
        }
    }
}