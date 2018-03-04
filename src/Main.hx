import haxegon.*;
import Globals.*;
import szene.*;
import utils.*;

class Main {

	function init(){
		CompileTime.importPackage("klasse");

		//Truetype fonts look a LOT better when we don't scale the canvas!
		Gfx.resizescreen(0, 0);
		Text.font = GUI.font;

		var playableClasses = Klassemanager.AlleSpielbareKlassen();
		//initial all globals here

		state.language = Save.loadvalue("language");
		if (state.language==0){
			state.language=0;//ok does't do much			
		}
	}	

	function update() {	
		// Draw a white background
		Gfx.clearscreen(PAL.bg);
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;
		Text.wordwrap=w;

		Text.size=GUI.titleTextSize;
		Text.display(Text.CENTER,h/5,S("Ruestung","Ruestung"), PAL.titelFarbe);

		if (IMGUI.button( Text.CENTER,Math.round(h/2+80),S("Zu einer Reise aufbrechen","Set off on an Adventure"))){
			Scene.change(szene.CharakterAuswahl);
		}

		if (IMGUI.schalter( Text.CENTER,Math.round(h/2+GUI.buttonTextSize*2.0+80),
		S("Deutsch","German"),
		S("Englisch","English"),
		1-state.language)){
			state.language=1-state.language;
			Save.savevalue("language",state.language);
		}

		Text.size=1;
		
	}
}
