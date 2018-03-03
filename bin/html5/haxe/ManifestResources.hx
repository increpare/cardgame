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
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_graphics_fonts_inconsolata_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_graphics_fonts_inconsolata_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_graphics_fonts_oswald_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_graphics_fonts_opensans_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_graphics_fonts_shadowsintolight_ttf);
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy27:data%2Fgraphics%2Ftitle.pngy4:sizei2931y4:typey5:IMAGEy2:idR1y7:preloadtgoR2i66352R3y4:FONTy9:classNamey49:__ASSET__data_graphics_fonts_inconsolata_bold_ttfR5y46:data%2Fgraphics%2Ffonts%2Finconsolata_bold.ttfR6tgoR2i84548R3R7R8y44:__ASSET__data_graphics_fonts_inconsolata_ttfR5y41:data%2Fgraphics%2Ffonts%2Finconsolata.ttfR6tgoR0y43:data%2Fgraphics%2Ffonts%2Fpixel%2Fpixel.fntR2i20629R3y4:TEXTR5R13R6tgoR0y45:data%2Fgraphics%2Ffonts%2Fpixel%2Fpixel_0.pngR2i2405R3R4R5R15R6tgoR2i50944R3R7R8y39:__ASSET__data_graphics_fonts_oswald_ttfR5y36:data%2Fgraphics%2Ffonts%2Foswald.ttfR6tgoR2i217360R3R7R8y41:__ASSET__data_graphics_fonts_opensans_ttfR5y38:data%2Fgraphics%2Ffonts%2Fopensans.ttfR6tgoR2i54304R3R7R8y49:__ASSET__data_graphics_fonts_shadowsintolight_ttfR5y46:data%2Fgraphics%2Ffonts%2Fshadowsintolight.ttfR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__data_graphics_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_inconsolata_bold_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_inconsolata_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_pixel_pixel_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_pixel_pixel_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_oswald_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_opensans_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fonts_shadowsintolight_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("data/graphics/title.png") #if display private #end class __ASSET__data_graphics_title_png extends lime.graphics.Image {}
@:font("bin/html5/obj/webfont/inconsolata_bold.ttf") #if display private #end class __ASSET__data_graphics_fonts_inconsolata_bold_ttf extends lime.text.Font {}
@:font("bin/html5/obj/webfont/inconsolata.ttf") #if display private #end class __ASSET__data_graphics_fonts_inconsolata_ttf extends lime.text.Font {}
@:file("data/graphics/fonts/pixel/pixel.fnt") #if display private #end class __ASSET__data_graphics_fonts_pixel_pixel_fnt extends haxe.io.Bytes {}
@:image("data/graphics/fonts/pixel/pixel_0.png") #if display private #end class __ASSET__data_graphics_fonts_pixel_pixel_0_png extends lime.graphics.Image {}
@:font("bin/html5/obj/webfont/oswald.ttf") #if display private #end class __ASSET__data_graphics_fonts_oswald_ttf extends lime.text.Font {}
@:font("bin/html5/obj/webfont/opensans.ttf") #if display private #end class __ASSET__data_graphics_fonts_opensans_ttf extends lime.text.Font {}
@:font("bin/html5/obj/webfont/shadowsintolight.ttf") #if display private #end class __ASSET__data_graphics_fonts_shadowsintolight_ttf extends lime.text.Font {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__data_graphics_fonts_inconsolata_bold_ttf') #if display private #end class __ASSET__data_graphics_fonts_inconsolata_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/inconsolata_bold"; #else ascender = 1759; descender = -389; height = 2148; numGlyphs = 304; underlinePosition = -410; underlineThickness = 102; unitsPerEM = 2048; #end name = "Inconsolata Bold"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_inconsolata_ttf') #if display private #end class __ASSET__data_graphics_fonts_inconsolata_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/inconsolata"; #else ascender = 859; descender = -190; height = 1049; numGlyphs = 303; underlinePosition = -200; underlineThickness = 50; unitsPerEM = 1000; #end name = "Inconsolata"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_oswald_ttf') #if display private #end class __ASSET__data_graphics_fonts_oswald_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/oswald"; #else ascender = 2444; descender = -591; height = 3035; numGlyphs = 419; underlinePosition = 0; underlineThickness = 0; unitsPerEM = 2048; #end name = "Oswald Regular"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_opensans_ttf') #if display private #end class __ASSET__data_graphics_fonts_opensans_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/opensans"; #else ascender = 2189; descender = -600; height = 2789; numGlyphs = 938; underlinePosition = -205; underlineThickness = 102; unitsPerEM = 2048; #end name = "Open Sans"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_shadowsintolight_ttf') #if display private #end class __ASSET__data_graphics_fonts_shadowsintolight_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/shadowsintolight"; #else ascender = 1203; descender = -442; height = 1645; numGlyphs = 352; underlinePosition = 0; underlineThickness = 0; unitsPerEM = 1024; #end name = "Shadows Into Light"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_inconsolata_bold_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_inconsolata_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_graphics_fonts_inconsolata_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_inconsolata_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_inconsolata_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_graphics_fonts_inconsolata_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_oswald_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_oswald_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_graphics_fonts_oswald_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_opensans_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_opensans_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_graphics_fonts_opensans_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_shadowsintolight_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_shadowsintolight_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__data_graphics_fonts_shadowsintolight_ttf ()); super (); }}


#end
#end