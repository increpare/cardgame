package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;
import fertigkeit.*;
import utils.*;

@spielbar
class Bauer implements Klasse
{   

    public var spielbar:Bool = true;
    
    public var bild:String = "bauer";

    public var name:StringPair = new StringPair(
        "Bauer",
        "Peasant"
    );

    public var beschreibung:StringPair = new StringPair(
        "Er hat ein armes Leben :(",
        "He has a miserable life :("
    );

    public var fertigkeiten:Array<Fertigkeit > = new Array<Fertigkeit >();

    public function new(){
        
    }
}