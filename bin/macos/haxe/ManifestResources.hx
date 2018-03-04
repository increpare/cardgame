package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_fonts_rosarivo_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_fonts_germaniaone_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_fonts_rosarivo_italic_ttf);
		
		#end
		
		var data, manifest, library;
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__data_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_how_to_add_assets_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)


@:keep #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/Rosarivo-Regular.ttf"; name = "Rosarivo"; super (); }}
@:keep #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/GermaniaOne-Regular.ttf"; name = "Germania One"; super (); }}
@:keep #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/Rosarivo-Italic.ttf"; name = "Rosarivo Italic"; super (); }}


#else

@:keep @:expose('__ASSET__data_fonts_rosarivo_regular_ttf') #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/Rosarivo-Regular.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Rosarivo"; super (); }}
@:keep @:expose('__ASSET__data_fonts_germaniaone_regular_ttf') #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/GermaniaOne-Regular.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Germania One"; super (); }}
@:keep @:expose('__ASSET__data_fonts_rosarivo_italic_ttf') #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/Rosarivo-Italic.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Rosarivo Italic"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__data_fonts_rosarivo_regular_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_rosarivo_regular_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/Rosarivo-Regular.ttf"; #end name = "Rosarivo"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_fonts_germaniaone_regular_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_germaniaone_regular_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/GermaniaOne-Regular.ttf"; #end name = "Germania One"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_fonts_rosarivo_italic_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_rosarivo_italic_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/fonts/Rosarivo-Italic.ttf"; #end name = "Rosarivo Italic"; super (); }}


#end
#end