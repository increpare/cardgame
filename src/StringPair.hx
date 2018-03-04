package;
import haxegon.*;
import Globals.*;

class StringPair
{
    public var de:String;
    public var en:String; 

    function new(_de:String,_en:String){
        this.de=_de;
        this.en=_en;
    }

    public function Eval():String{
        return S(de,en);
    }
}