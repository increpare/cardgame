package;
import haxegon.*;
import Globals.*;

interface StringPair
{
    public de:String;
    public en:String; 
    public new(de:String,en:String){
        this.de=de;
        this.en=en;
    }

    public S():String{
        return S(de,en);
    }
}