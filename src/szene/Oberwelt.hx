package szene;

import haxegon.*;
import Globals.*;
import ort.*;
import klasse.*;
import fertigkeit.*;
import szene.*;
import utils.*;

class Oberwelt {

	var ort:Ort;
	var spielerklasse:Klasse;

	function init(){
		Text.font = GUI.font;

		var spielerklassetypen = Lambda.array(CompileTime.getAllClasses(Klasse));
		var spielerklassetyp = spielerklassetypen[state.auserwaehlte];
		spielerklasse = Type.createInstance(spielerklassetyp,[]);

		var orttypen = Lambda.array(CompileTime.getAllClasses(Ort));
		var orttyp = orttypen[state.ort];
		ort = Type.createInstance(orttyp,[]);
	}	

	function drawDetailsPanel(ox:Int,oy:Int,klasse:Klasse){
		Text.size=GUI.smalltextsize;
		var bild = "bilder/"+klasse.bild;
		var ih = Gfx.imageheight(bild);
		var iw = Gfx.imagewidth(bild);
		Text.display(ox,oy,klasse.name.Eval(),PAL.fg);
		oy+=Math.round(Text.size)+GUI.vpadding;
		Gfx.drawimage(ox,oy,bild);
		oy+=ih+GUI.vpadding;
		var hpc:Float = klasse.health/klasse.maxHealth;
		var hpstring = klasse.health+"/"+klasse.maxHealth;
		Gfx.fillbox(ox,oy,iw,Text.size+20,PAL.bg);
		Gfx.fillbox(ox,oy,iw*hpc,Text.size+20,Col.RED);
		Gfx.drawbox(ox,oy,iw,Text.size+20,PAL.fg);
		Text.display(ox+20,oy+4,hpstring,PAL.fg);

	}
	function update() {	
		drawDetailsPanel(10,10,spielerklasse);



	}
}
