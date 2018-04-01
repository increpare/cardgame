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
		
		data = '{"name":null,"assets":"aoy4:pathy15:data%2Ficon.pngy4:sizei143966y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y34:data%2Fhow%20to%20add%20assets.txtR2i6664R3y4:TEXTR5R7R6tgoR0y22:data%2Ftext%2Forte.csvR2i466R3R8R5R9R6tgoR0y27:data%2Ftext%2Fkreaturen.csvR2i1062R3R8R5R10R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fstair.pngR2i8328R3R4R5R11R6tgoR0y41:data%2Fgraphics%2Fsprites%2Fhanderfly.pngR2i8846R3R4R5R12R6tgoR0y38:data%2Fgraphics%2Fsprites%2Ffussee.pngR2i11861R3R4R5R13R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fnosema.pngR2i12771R3R4R5R14R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fbaldy.pngR2i10486R3R4R5R15R6tgoR0y38:data%2Fgraphics%2Fsprites%2Ftimond.pngR2i8193R3R4R5R16R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fcatzy.pngR2i11528R3R4R5R17R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fjotwolk.pngR2i7384R3R4R5R18R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fdwage.pngR2i11107R3R4R5R19R6tgoR0y40:data%2Fgraphics%2Fsprites%2Foutraged.pngR2i12612R3R4R5R20R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fmehi.pngR2i11226R3R4R5R21R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fsquiddy.pngR2i10249R3R4R5R22R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fpanto.pngR2i9393R3R4R5R23R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fpizzo.pngR2i8342R3R4R5R24R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fspokey.pngR2i10104R3R4R5R25R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftoken.pngR2i9340R3R4R5R26R6tgoR0y38:data%2Fgraphics%2Fsprites%2Flashes.pngR2i8722R3R4R5R27R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fdancen.pngR2i6335R3R4R5R28R6tgoR0y42:data%2Fgraphics%2Fsprites%2Ftripletoad.pngR2i8835R3R4R5R29R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fworm.pngR2i10503R3R4R5R30R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fgoner.pngR2i10301R3R4R5R31R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftoofs.pngR2i11851R3R4R5R32R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fearsy.pngR2i10005R3R4R5R33R6tgoR0y35:data%2Fgraphics%2Fsprites%2Fban.pngR2i10279R3R4R5R34R6tgoR0y39:data%2Fgraphics%2Fsprites%2Ffuschia.pngR2i6877R3R4R5R35R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fterra.pngR2i10920R3R4R5R36R6tgoR0y39:data%2Fgraphics%2Fsprites%2Ftripove.pngR2i10663R3R4R5R37R6tgoR0y35:data%2Fgraphics%2Fsprites%2Femm.pngR2i10212R3R4R5R38R6tgoR0y38:data%2Fgraphics%2Fsprites%2Feyeman.pngR2i8440R3R4R5R39R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fwalker.pngR2i10588R3R4R5R40R6tgoR0y33:data%2Fgraphics%2Fsprites%2F_.pngR2i1086R3R4R5R41R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fexey.pngR2i10485R3R4R5R42R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fsitking.pngR2i11150R3R4R5R43R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fnash.pngR2i10966R3R4R5R44R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fbutt.pngR2i6360R3R4R5R45R6tgoR0y40:data%2Fgraphics%2Fsprites%2Fnosehead.pngR2i10789R3R4R5R46R6tgoR0y38:data%2Fgraphics%2Fsprites%2Ffroggy.pngR2i8338R3R4R5R47R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fjaggy.pngR2i9921R3R4R5R48R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fdryeye.pngR2i9587R3R4R5R49R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fshelly.pngR2i12331R3R4R5R50R6tgoR0y42:data%2Fgraphics%2Fsprites%2Ffrogflower.pngR2i10238R3R4R5R51R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fruube.pngR2i10674R3R4R5R52R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fevileye.pngR2i9901R3R4R5R53R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fhgost.pngR2i12222R3R4R5R54R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftrotz.pngR2i11455R3R4R5R55R6tgoR0y34:data%2Fgraphics%2Fsprites%2Fpi.pngR2i11035R3R4R5R56R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fhairdy.pngR2i10630R3R4R5R57R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fblol.pngR2i10516R3R4R5R58R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fclava.pngR2i11471R3R4R5R59R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftrobo.pngR2i12451R3R4R5R60R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fhairman.pngR2i10450R3R4R5R61R6tgoR0y40:data%2Fgraphics%2Fsprites%2Ffutsheen.pngR2i13229R3R4R5R62R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fjowler.pngR2i10403R3R4R5R63R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fwave.pngR2i11820R3R4R5R64R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fhond.pngR2i8511R3R4R5R65R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fspake.pngR2i9062R3R4R5R66R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fjallo.pngR2i7929R3R4R5R67R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fbetti.pngR2i10304R3R4R5R68R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fflobble.pngR2i11722R3R4R5R69R6tgoR0y39:data%2Fgraphics%2Fsprites%2Funimout.pngR2i7674R3R4R5R70R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fcover.pngR2i9597R3R4R5R71R6tgoR0y36:data%2Fgraphics%2Fsprites%2Focti.pngR2i11700R3R4R5R72R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fargpig.pngR2i10112R3R4R5R73R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fbidrag.pngR2i14123R3R4R5R74R6tgoR0y40:data%2Fgraphics%2Fsprites%2Fbanangry.pngR2i9899R3R4R5R75R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fcrab.pngR2i11519R3R4R5R76R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftworl.pngR2i10347R3R4R5R77R6tgoR0y35:data%2Fgraphics%2Fsprites%2Fwop.pngR2i10203R3R4R5R78R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fmindin.pngR2i6802R3R4R5R79R6tgoR0y37:data%2Fgraphics%2Fsprites%2Ftoady.pngR2i8651R3R4R5R80R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fkrown.pngR2i10031R3R4R5R81R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fshrage.pngR2i12465R3R4R5R82R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fwiking.pngR2i10256R3R4R5R83R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fhapps.pngR2i11065R3R4R5R84R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fupside.pngR2i10080R3R4R5R85R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fbosip.pngR2i12921R3R4R5R86R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fflaj.pngR2i9964R3R4R5R87R6tgoR0y39:data%2Fgraphics%2Fsprites%2Ftendril.pngR2i8921R3R4R5R88R6tgoR0y36:data%2Fgraphics%2Fsprites%2Fboxy.pngR2i10961R3R4R5R89R6tgoR0y39:data%2Fgraphics%2Fsprites%2Fprikkel.pngR2i10316R3R4R5R90R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fnasen.pngR2i10054R3R4R5R91R6tgoR0y38:data%2Fgraphics%2Fsprites%2Fhedgey.pngR2i9146R3R4R5R92R6tgoR0y37:data%2Fgraphics%2Fsprites%2Fbifur.pngR2i11838R3R4R5R93R6tgoR0y38:data%2Fgraphics%2Fbilder%2Fsteppen.pngR2i84880R3R4R5R94R6tgoR0y39:data%2Fgraphics%2Fbilder%2Fbergwerk.pngR2i240964R3R4R5R95R6tgoR0y34:data%2Fgraphics%2Fbilder%2Ftal.pngR2i86315R3R4R5R96R6tgoR0y36:data%2Fgraphics%2Fbilder%2Fforst.pngR2i151580R3R4R5R97R6tgoR0y36:data%2Fgraphics%2Fbilder%2Finsel.pngR2i59422R3R4R5R98R6tgoR0y36:data%2Fgraphics%2Fbilder%2Fpolar.pngR2i96739R3R4R5R99R6tgoR0y38:data%2Fgraphics%2Fbilder%2Flandung.pngR2i76360R3R4R5R100R6tgoR0y37:data%2Fgraphics%2Fbilder%2Fhoehle.pngR2i247093R3R4R5R101R6tgoR2i41344R3y4:FONTy9:classNamey40:__ASSET__data_fonts_rosarivo_regular_ttfR5y35:data%2Ffonts%2FRosarivo-Regular.ttfR6tgoR2i33240R3R102R103y43:__ASSET__data_fonts_germaniaone_regular_ttfR5y38:data%2Ffonts%2FGermaniaOne-Regular.ttfR6tgoR2i39244R3R102R103y39:__ASSET__data_fonts_rosarivo_italic_ttfR5y34:data%2Ffonts%2FRosarivo-Italic.ttfR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind #if display private #end class __ASSET__data_text_orte_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__data_text_kreaturen_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_stair_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_handerfly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_fussee_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_nosema_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_baldy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_timond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_catzy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_jotwolk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_dwage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_outraged_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_mehi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_squiddy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_panto_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_pizzo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_spokey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_token_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_lashes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_dancen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_tripletoad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_worm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_goner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_toofs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_earsy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_ban_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_fuschia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_terra_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_tripove_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_emm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_eyeman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_walker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites___png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_exey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_sitking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_nash_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_butt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_nosehead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_froggy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_jaggy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_dryeye_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_shelly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_frogflower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_ruube_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_evileye_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_hgost_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_trotz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_pi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_hairdy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_blol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_clava_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_trobo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_hairman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_futsheen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_jowler_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_wave_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_hond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_spake_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_jallo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_betti_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_flobble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_unimout_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_cover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_octi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_argpig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_bidrag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_banangry_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_crab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_tworl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_wop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_mindin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_toady_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_krown_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_shrage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_wiking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_happs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_upside_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_bosip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_flaj_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_tendril_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_boxy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_prikkel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_nasen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_hedgey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_sprites_bifur_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_steppen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_bergwerk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_tal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_forst_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_insel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_polar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_landung_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bilder_hoehle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_germaniaone_regular_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_rosarivo_italic_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("data/icon.png") #if display private #end class __ASSET__data_icon_png extends lime.graphics.Image {}
@:file("data/how to add assets.txt") #if display private #end class __ASSET__data_how_to_add_assets_txt extends haxe.io.Bytes {}
@:file("data/text/orte.csv") #if display private #end class __ASSET__data_text_orte_csv extends haxe.io.Bytes {}
@:file("data/text/kreaturen.csv") #if display private #end class __ASSET__data_text_kreaturen_csv extends haxe.io.Bytes {}
@:image("data/graphics/sprites/stair.png") #if display private #end class __ASSET__data_graphics_sprites_stair_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/handerfly.png") #if display private #end class __ASSET__data_graphics_sprites_handerfly_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/fussee.png") #if display private #end class __ASSET__data_graphics_sprites_fussee_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/nosema.png") #if display private #end class __ASSET__data_graphics_sprites_nosema_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/baldy.png") #if display private #end class __ASSET__data_graphics_sprites_baldy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/timond.png") #if display private #end class __ASSET__data_graphics_sprites_timond_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/catzy.png") #if display private #end class __ASSET__data_graphics_sprites_catzy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/jotwolk.png") #if display private #end class __ASSET__data_graphics_sprites_jotwolk_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/dwage.png") #if display private #end class __ASSET__data_graphics_sprites_dwage_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/outraged.png") #if display private #end class __ASSET__data_graphics_sprites_outraged_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/mehi.png") #if display private #end class __ASSET__data_graphics_sprites_mehi_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/squiddy.png") #if display private #end class __ASSET__data_graphics_sprites_squiddy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/panto.png") #if display private #end class __ASSET__data_graphics_sprites_panto_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/pizzo.png") #if display private #end class __ASSET__data_graphics_sprites_pizzo_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/spokey.png") #if display private #end class __ASSET__data_graphics_sprites_spokey_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/token.png") #if display private #end class __ASSET__data_graphics_sprites_token_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/lashes.png") #if display private #end class __ASSET__data_graphics_sprites_lashes_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/dancen.png") #if display private #end class __ASSET__data_graphics_sprites_dancen_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/tripletoad.png") #if display private #end class __ASSET__data_graphics_sprites_tripletoad_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/worm.png") #if display private #end class __ASSET__data_graphics_sprites_worm_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/goner.png") #if display private #end class __ASSET__data_graphics_sprites_goner_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/toofs.png") #if display private #end class __ASSET__data_graphics_sprites_toofs_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/earsy.png") #if display private #end class __ASSET__data_graphics_sprites_earsy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/ban.png") #if display private #end class __ASSET__data_graphics_sprites_ban_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/fuschia.png") #if display private #end class __ASSET__data_graphics_sprites_fuschia_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/terra.png") #if display private #end class __ASSET__data_graphics_sprites_terra_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/tripove.png") #if display private #end class __ASSET__data_graphics_sprites_tripove_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/emm.png") #if display private #end class __ASSET__data_graphics_sprites_emm_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/eyeman.png") #if display private #end class __ASSET__data_graphics_sprites_eyeman_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/walker.png") #if display private #end class __ASSET__data_graphics_sprites_walker_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/_.png") #if display private #end class __ASSET__data_graphics_sprites___png extends lime.graphics.Image {}
@:image("data/graphics/sprites/exey.png") #if display private #end class __ASSET__data_graphics_sprites_exey_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/sitking.png") #if display private #end class __ASSET__data_graphics_sprites_sitking_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/nash.png") #if display private #end class __ASSET__data_graphics_sprites_nash_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/butt.png") #if display private #end class __ASSET__data_graphics_sprites_butt_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/nosehead.png") #if display private #end class __ASSET__data_graphics_sprites_nosehead_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/froggy.png") #if display private #end class __ASSET__data_graphics_sprites_froggy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/jaggy.png") #if display private #end class __ASSET__data_graphics_sprites_jaggy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/dryeye.png") #if display private #end class __ASSET__data_graphics_sprites_dryeye_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/shelly.png") #if display private #end class __ASSET__data_graphics_sprites_shelly_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/frogflower.png") #if display private #end class __ASSET__data_graphics_sprites_frogflower_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/ruube.png") #if display private #end class __ASSET__data_graphics_sprites_ruube_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/evileye.png") #if display private #end class __ASSET__data_graphics_sprites_evileye_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/hgost.png") #if display private #end class __ASSET__data_graphics_sprites_hgost_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/trotz.png") #if display private #end class __ASSET__data_graphics_sprites_trotz_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/pi.png") #if display private #end class __ASSET__data_graphics_sprites_pi_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/hairdy.png") #if display private #end class __ASSET__data_graphics_sprites_hairdy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/blol.png") #if display private #end class __ASSET__data_graphics_sprites_blol_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/clava.png") #if display private #end class __ASSET__data_graphics_sprites_clava_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/trobo.png") #if display private #end class __ASSET__data_graphics_sprites_trobo_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/hairman.png") #if display private #end class __ASSET__data_graphics_sprites_hairman_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/futsheen.png") #if display private #end class __ASSET__data_graphics_sprites_futsheen_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/jowler.png") #if display private #end class __ASSET__data_graphics_sprites_jowler_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/wave.png") #if display private #end class __ASSET__data_graphics_sprites_wave_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/hond.png") #if display private #end class __ASSET__data_graphics_sprites_hond_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/spake.png") #if display private #end class __ASSET__data_graphics_sprites_spake_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/jallo.png") #if display private #end class __ASSET__data_graphics_sprites_jallo_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/betti.png") #if display private #end class __ASSET__data_graphics_sprites_betti_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/flobble.png") #if display private #end class __ASSET__data_graphics_sprites_flobble_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/unimout.png") #if display private #end class __ASSET__data_graphics_sprites_unimout_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/cover.png") #if display private #end class __ASSET__data_graphics_sprites_cover_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/octi.png") #if display private #end class __ASSET__data_graphics_sprites_octi_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/argpig.png") #if display private #end class __ASSET__data_graphics_sprites_argpig_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/bidrag.png") #if display private #end class __ASSET__data_graphics_sprites_bidrag_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/banangry.png") #if display private #end class __ASSET__data_graphics_sprites_banangry_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/crab.png") #if display private #end class __ASSET__data_graphics_sprites_crab_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/tworl.png") #if display private #end class __ASSET__data_graphics_sprites_tworl_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/wop.png") #if display private #end class __ASSET__data_graphics_sprites_wop_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/mindin.png") #if display private #end class __ASSET__data_graphics_sprites_mindin_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/toady.png") #if display private #end class __ASSET__data_graphics_sprites_toady_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/krown.png") #if display private #end class __ASSET__data_graphics_sprites_krown_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/shrage.png") #if display private #end class __ASSET__data_graphics_sprites_shrage_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/wiking.png") #if display private #end class __ASSET__data_graphics_sprites_wiking_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/happs.png") #if display private #end class __ASSET__data_graphics_sprites_happs_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/upside.png") #if display private #end class __ASSET__data_graphics_sprites_upside_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/bosip.png") #if display private #end class __ASSET__data_graphics_sprites_bosip_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/flaj.png") #if display private #end class __ASSET__data_graphics_sprites_flaj_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/tendril.png") #if display private #end class __ASSET__data_graphics_sprites_tendril_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/boxy.png") #if display private #end class __ASSET__data_graphics_sprites_boxy_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/prikkel.png") #if display private #end class __ASSET__data_graphics_sprites_prikkel_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/nasen.png") #if display private #end class __ASSET__data_graphics_sprites_nasen_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/hedgey.png") #if display private #end class __ASSET__data_graphics_sprites_hedgey_png extends lime.graphics.Image {}
@:image("data/graphics/sprites/bifur.png") #if display private #end class __ASSET__data_graphics_sprites_bifur_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/steppen.png") #if display private #end class __ASSET__data_graphics_bilder_steppen_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/bergwerk.png") #if display private #end class __ASSET__data_graphics_bilder_bergwerk_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/tal.png") #if display private #end class __ASSET__data_graphics_bilder_tal_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/forst.png") #if display private #end class __ASSET__data_graphics_bilder_forst_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/insel.png") #if display private #end class __ASSET__data_graphics_bilder_insel_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/polar.png") #if display private #end class __ASSET__data_graphics_bilder_polar_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/landung.png") #if display private #end class __ASSET__data_graphics_bilder_landung_png extends lime.graphics.Image {}
@:image("data/graphics/bilder/hoehle.png") #if display private #end class __ASSET__data_graphics_bilder_hoehle_png extends lime.graphics.Image {}
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