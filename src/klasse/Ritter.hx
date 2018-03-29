package klasse;
import haxegon.*;
import std.*;
import haxe.rtti.Meta;
import fertigkeit.*;
import utils.*;

@spielbar
@aufgeschlossen
class Ritter implements Klasse
{       
    public var bild:String = "ritter";

    public var name:StringPair = new StringPair(
        "Ritter",
        "Knight"
        );

    public var beschreibung:StringPair = new StringPair(
        "Was für ein Held!",
        "What a hero!"
    );

    public var fertigkeiten:Array<Fertigkeit> = new Array<Fertigkeit>();

    public var maxHealth:Int=80;
    public var health:Int=30;
    
    public function new(){
        
    }
}