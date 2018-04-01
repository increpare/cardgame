import haxe.rtti.Meta;
import haxegon.*;
import klasse.*;
import ort.*;
import fertigkeit.*;
import utils.*;

class Klassemanager
{

    public static var charakterklassen : Map<String,Klasse>;

    public static function klasseBeispiel(kt:Class<Klasse>):Klasse{
        return charakterklassen[Type.getClassName(kt)];
    }

    public static var orteklassen : Map<String,Ort>;

    public static function ortBeispiel(ot:Class<Ort>):Ort{
        return orteklassen[Type.getClassName(ot)];
    }


    public static function init(){
        var ks = CompileTime.getAllClasses(Klasse);
        charakterklassen=new Map<String,Klasse>();
        for (kt in ks){
            var k = Type.createInstance(kt,[]);
            charakterklassen[Type.getClassName(kt)]=k;
        }


        var os = CompileTime.getAllClasses(Ort);
        orteklassen=new Map<String,Ort>();
        for (ot in os){
            var o = Type.createInstance(ot,[]);
            orteklassen[Type.getClassName(ot)]=o;
        }
    }


    public static function alleOrte():Array<Class<Ort> > {     
          
        var ks = CompileTime.getAllClasses(Ort);
        var ergebnis:Array<Class<Ort> > = new Array<Class<Ort> >();
        for ( k in ks ) {           
            ergebnis.push(k);
        }
        return ergebnis;                   
    }


    public static function alleAufschliessendenKlassen():Array<Class<Klasse> > {     
          
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

    public static function alleSpielbareKlassen() : Array<Class<Klasse> > {        
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

    public static function alleKlassen():Array<Class<Klasse> > {        
        var ks = CompileTime.getAllClasses(Klasse);
        var ergebnis:Array<Class<Klasse> > = new Array < Class <Klasse> > ();
		for ( k in ks ) {
            ergebnis.push(k);
        }
        return ergebnis;
    }
}