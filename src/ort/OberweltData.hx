package ort;

import haxegon.*;
import Globals.*;
import szene.*;
import utils.*;

class OberweltData
{
    public var dat : Array<Array<Dynamic>>;

    public function new(){
        dat = new Array<Array<Dynamic>>();
        for (i in 0...CONST.invW){
            var col = new Array<Dynamic>();
            for (j in 0...CONST.invH){              
                var e = {
                    name : Kreaturen[i*CONST.invH+j].name,
                    bild : Kreaturen[i*CONST.invH+j].bild,
                };
                if (i>=2 && i<=3 && j==2){
                    e = {
                        name : "_",
                        bild : "sprites/_",
                    };  
                } 

                col.push(e);
            }
            dat.push(col);
        }
    }
}