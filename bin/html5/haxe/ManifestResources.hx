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
		
		data = '{"name":null,"assets":"aoy4:pathy15:data%2Ficon.pngy4:sizei143966y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y34:data%2Fhow%20to%20add%20assets.txtR2i6664R3y4:TEXTR5R7R6tgoR2i41344R3y4:FONTy9:classNamey40:__ASSET__data_fonts_rosarivo_regular_ttfR5y35:data%2Ffonts%2FRosarivo-Regular.ttfR6tgoR2i33240R3R9R10y43:__ASSET__data_fonts_germaniaone_regular_ttfR5y38:data%2Ffonts%2FGermaniaOne-Regular.ttfR6tgoR2i39244R3R9R10y39:__ASSET__data_fonts_rosarivo_italic_ttfR5y34:data%2Ffonts%2FRosarivo-Italic.ttfR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
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

@:image("data/icon.png") #if display private #end class __ASSET__data_icon_png extends lime.graphics.Image {}
@:file("data/how to add assets.txt") #if display private #end class __ASSET__data_how_to_add_assets_txt extends haxe.io.Bytes {}
@:font("bin/html5/obj/webfont/Rosarivo-Regular.ttf") #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends lime.text.Font {}
@:font("bin/html5/obj/webfont/GermaniaOne-Regular.ttf") #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends lime.text.Font {}
@:font("bin/html5/obj/webfont/Rosarivo-Italic.ttf") #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends lime.text.Font {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__data_fonts_rosarivo_regular_ttf') #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/Rosarivo-Regular"; #else ascender = 979; descender = -424; height = 1403; numGlyphs = 232; underlinePosition = -133; underlineThickness = 67; unitsPerEM = 1000; #end name = "Rosarivo"; super (); }}
@:keep @:expose('__ASSET__data_fonts_germaniaone_regular_ttf') #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/GermaniaOne-Regular"; #else ascender = 911; descender = -250; height = 1161; numGlyphs = 282; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Germania One"; super (); }}
@:keep @:expose('__ASSET__data_fonts_rosarivo_italic_ttf') #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/fonts/Rosarivo-Italic"; #else ascender = 979; descender = -424; height = 1403; numGlyphs = 240; underlinePosition = -133; underlineThickness = 67; unitsPerEM = 1000; #end name = "Rosarivo Italic"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__data_fonts_rosarivo_regular_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_rosarivo_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_fonts_rosarivo_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_fonts_germaniaone_regular_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_germaniaone_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_fonts_germaniaone_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_fonts_rosarivo_italic_ttf') #if display private #end class __ASSET__OPENFL__data_fonts_rosarivo_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_fonts_rosarivo_italic_ttf ()); super (); }}


#end
#end