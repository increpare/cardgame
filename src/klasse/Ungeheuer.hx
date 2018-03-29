package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;
import fertigkeit.*;
import utils.*;

@spielbar
class Ungeheuer implements Klasse
{   

    public var spielbar:Bool = true;
    
    public var bild:String = "ungeheuer";

    public var name:StringPair = new StringPair(
        "Ungeheuer",
        "Immensity"
    );

    public var beschreibung:StringPair = new StringPair(
        "So einschüchternd groß!",
        "A monstrous being."
    );

    public var fertigkeiten:Array<Fertigkeit > = new Array<Fertigkeit >();

    public var maxHealth:Int=80;
    public var health:Int=60;
    
    public function new(){
        
    }
}