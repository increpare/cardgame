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
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
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


@:keep #if display private #end class __ASSET__data_graphics_fonts_inconsolata_bold_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/inconsolata_bold.ttf"; name = "Inconsolata Bold"; super (); }}
@:keep #if display private #end class __ASSET__data_graphics_fonts_inconsolata_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/inconsolata.ttf"; name = "Inconsolata"; super (); }}
@:keep #if display private #end class __ASSET__data_graphics_fonts_oswald_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/oswald.ttf"; name = "Oswald Regular"; super (); }}
@:keep #if display private #end class __ASSET__data_graphics_fonts_opensans_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/opensans.ttf"; name = "Open Sans"; super (); }}
@:keep #if display private #end class __ASSET__data_graphics_fonts_shadowsintolight_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/shadowsintolight.ttf"; name = "Shadows Into Light"; super (); }}


#else

@:keep @:expose('__ASSET__data_graphics_fonts_inconsolata_bold_ttf') #if display private #end class __ASSET__data_graphics_fonts_inconsolata_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/inconsolata_bold.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Inconsolata Bold"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_inconsolata_ttf') #if display private #end class __ASSET__data_graphics_fonts_inconsolata_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/inconsolata.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Inconsolata"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_oswald_ttf') #if display private #end class __ASSET__data_graphics_fonts_oswald_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/oswald.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Oswald Regular"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_opensans_ttf') #if display private #end class __ASSET__data_graphics_fonts_opensans_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/opensans.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Open Sans"; super (); }}
@:keep @:expose('__ASSET__data_graphics_fonts_shadowsintolight_ttf') #if display private #end class __ASSET__data_graphics_fonts_shadowsintolight_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "data/graphics/fonts/shadowsintolight.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Shadows Into Light"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_inconsolata_bold_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_inconsolata_bold_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/inconsolata_bold.ttf"; #end name = "Inconsolata Bold"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_inconsolata_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_inconsolata_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/inconsolata.ttf"; #end name = "Inconsolata"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_oswald_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_oswald_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/oswald.ttf"; #end name = "Oswald Regular"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_opensans_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_opensans_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/opensans.ttf"; #end name = "Open Sans"; super (); }}
@:keep @:expose('__ASSET__OPENFL__data_graphics_fonts_shadowsintolight_ttf') #if display private #end class __ASSET__OPENFL__data_graphics_fonts_shadowsintolight_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "data/graphics/fonts/shadowsintolight.ttf"; #end name = "Shadows Into Light"; super (); }}


#end
#end