package klasse;
import haxe.rtti.Meta;

class KlasseManager
{
    static function AllSpielbareKlassen:Array<Class>(){        
        var klassen = CompileTime.getAllClasses(klasse.Klasse);
        var ergebnis:Array<Type> = new Array<Type>();
		for ( k in klassen ) {
			var statics = Meta.getType(k);            
			if (Reflect.hasField(statics,"spielbar"))
			{            
                ergebnis.push(k);
			}
    }
    static function AlleKlassen:Array<Class>(){        
        var klassen = CompileTime.getAllClasses(klasse.Klasse);
        var ergebnis:Array<Type> = new Array<Type>();
		for ( k in klassen ) {
			var statics = Meta.getType(k);            
			if (Reflect.hasField(statics,"spielbar"))
			{            
                ergebnis.push(k);
			}
    }
    
    return ergebnis;

}