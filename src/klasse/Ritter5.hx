package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;

@:keep
@spielbar
class Ritter5 implements Klasse
{   
    public function new(){
        //Reflect()
        //https://haxe.org/manual/cr-rtti.html
        //trace(Meta.getType(Ritter));
    }

    public var bild:String = "Ritter5";
    public var name:StringPair;
    public var beschreibung:StringPair;
    public var fertigkeiten:Array<Fertigkeit>;

}