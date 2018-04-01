package ort;

import haxegon.*;
import Globals.*;
import szene.*;
import utils.*;

class OberweltData
{
    var dat : Array<Array<Dynamic>>;

    public function new(){
        dat = new Array<Array<Dynamic>>();
        for (i in 0...CONST.invW){
            var col = new Array<Dynamic>();
            for (j in 0...CONST.invH){
                var e = {
                    name : Kreaturen[i*CONST.invH+j].name,
                    img : Kreaturen[i*CONST.invH+j].img,
                };
                col.push(e);
            }
            dat.push(col);
        }
    }
}