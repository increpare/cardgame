package klasse;

import utils.*;
import fertigkeit.*;

interface Klasse
{
    public var bild:String;
    public var name:StringPair;
    public var beschreibung:StringPair;
    public var fertigkeiten:Array<Fertigkeit>;

    public var maxHealth:Int;
    public var health:Int;
}