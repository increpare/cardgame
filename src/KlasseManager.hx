import haxe.rtti.Meta;
import haxegon.*;
import klasse.*;
import fertigkeit.*;
import utils.*;

class Klassemanager
{
    public static function AlleAufschliessendenKlassen():Array<Class<Klasse> > {     
          
        var ks = CompileTime.getAllClasses(Klasse);
        var ergebnis:Array<Class<Klasse> > = new Array<Class<Klasse> >();
		
        for ( k in ks ) {           
            var meta = Meta.getType(k);
            if (Reflect.hasField(meta,"spielbar")){
                if (Save.loadvalue("aufgeschlossen_"+Type.getClassName(k))==1 || 
                    Reflect.hasField(meta,"aufgeschlossen")){
                    ergebnis.push(k);
                }
            }
        }
        return ergebnis;                   
    }

    public static function AlleSpielbareKlassen() : Array<Class<Klasse> > {        
        var ks = CompileTime.getAllClasses(Klasse);
        var ergebnis:Array<Class<Klasse> > = new Array<Class<Klasse> >();
		
        for ( k in ks ) {           
            var meta = Meta.getType(k);
            if (Reflect.hasField(meta,"spielbar")){
                ergebnis.push(k);
            }
        }
        return ergebnis;        
    }

    public static function AlleKlassen():Array<Class<Klasse> > {        
        var ks = CompileTime.getAllClasses(Klasse);
        var ergebnis:Array<Class<Klasse> > = new Array < Class <Klasse> > ();
		for ( k in ks ) {
            ergebnis.push(k);
        }
        return ergebnis;
    }
}