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
		
		data = '{"name":null,"assets":"aoy4:pathy15:data%2Ficon.pngy4:sizei143966y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y34:data%2Fhow%20to%20add%20assets.txtR2i6664R3y4:TEXTR5R7R6tgoR0y38:data%2Fgraphics%2Fbilder%2Fritter3.pngR2i3211R3R4R5R9R6tgoR0y37:data%2Fgraphics%2Fbilder%2Fritter.pngR2i5899R3R4R5R10R6tgoR0y38:data%2Fgraphics%2Fbilder%2Fritter2.pngR2i3570R3R4R5R11R6tgoR0y38:data%2Fgraphics%2Fbilder%2Fritter5.pngR2i3293R3R4R5R12R6tgoR0y42:data%2Fgraphics%2Fbilder%2Fritter6plus.pngR2i3101R3R4R5R13R6tgoR0y38:data%2Fgraphics%2Fbilder%2Fritter4.pngR2i3229R3R4R5R14R6tgoR0y35:data%2Fgraphics%2Fbilder%2Fpilz.pngR2i4635R3R4R5R15R6tgoR0y40:data%2Fgraphics%2Fbilder%2Fungeheuer.pngR2i5014R3R4R5R16R6tgoR0y36:data%2Fgraphics%2Fbilder%2Fbauer.pngR2i6110R3R4R5R17R6tgoR2i41344R3y4:FONTy9:classNamey40:__ASSET__data_fonts_rosarivo_regular_ttfR5y35:data%2Ffonts%2FRosarivo-Regular.ttfR6tgoR2i33240R3R18R19y43:__ASSET__data_fonts_germaniaone_regular_ttfR5y38:data%2Ffonts%2FGermaniaOne-Regular.ttfR6tgoR2i39244R3R18R19y39:__ASSET__data_fonts_rosarivo_italic_ttfR5y34:data%2Ffonts%2FRosarivo-Italic.ttfR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter6plus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ritter4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_pilz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_ungeheuer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_bauer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("data/icon.png") #if display private #end class __ASSET__data_icon_png extends lime.graphics.Image {}
@:file("data/how to add assets.txt") #if display private #end class __ASSET__data_how_to_add_assets_txt extends haxe.io.Bytes {}
@:image("data/graphics/bilder/ritter3.png") #if display private #end class __ASSET__data_graphics_bilder_ritter3_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ritter.png") #if display private #end class __ASSET__data_graphics_bilder_ritter_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ritter2.png") #if display private #end class __ASSET__data_graphics_bilder_ritter2_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ritter5.png") #if display private #end class __ASSET__data_graphics_bilder_ritter5_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ritter6plus.png") #if display private #end class __ASSET__data_graphics_bilder_ritter6plus_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ritter4.png") #if display private #end class __ASSET__data_graphics_bilder_ritter4_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/pilz.png") #if display private #end class __ASSET__data_graphics_bilder_pilz_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/ungeheuer.png") #if display private #end class __ASSET__data_graphics_bilder_ungeheuer_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/bauer.png") #if display private #end class __ASSET__data_graphics_bilder_bauer_png extends lime.graphics.Image {}
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