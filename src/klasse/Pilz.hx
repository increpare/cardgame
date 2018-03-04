package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;
import fertigkeit.*;
import utils.*;

class Pilz implements Klasse
{   

    public var spielbar:Bool = true;
    
    public var bild:String = "ungeheuer";

    public var name:StringPair = new StringPair(
        "Pilz",
        "Mushroom"
    );

    public var beschreibung:StringPair = new StringPair(
        "Lecker!",
        "Delicious"
    );

    public var fertigkeiten:Array<Fertigkeit > = new Array<Fertigkeit >();

    public function new(){
        
    }
}