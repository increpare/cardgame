package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;
import fertigkeit.*;
import utils.*;

class Pilz implements Klasse
{   

    public var spielbar:Bool = true;
    
    public var bild:String = "pilz";

    public var name:StringPair = new StringPair(
        "Pilz",
        "Mushroom"
    );

    public var beschreibung:StringPair = new StringPair(
        "Lecker!",
        "Delicious"
    );

    public var fertigkeiten:Array<Fertigkeit > = new Array<Fertigkeit >();

    public var maxHealth:Int=80;
    public var health:Int=40;
    
    public function new(){
        
    }
}