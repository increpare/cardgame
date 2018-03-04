package klasse;
import std.*;

@:keep
//@spielbar
class Bauer implements Klasse
{   
    public function new(){
        //Reflect()
        //https://haxe.org/manual/cr-rtti.html
        //trace(Meta.getType(Ritter));
    }

    public var bild:String;
    public var name:StringPair;
    public var beschreibung:StringPair;
    public var fertigkeiten:Array<Fertigkeit>;

}