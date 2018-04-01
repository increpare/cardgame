package szene;

import haxegon.*;
import Globals.*;
import ort.*;
import utils.*;

class OrtAuswahl {

	var orte:Array<Class<Ort> >;
	function init(){
		Text.font = GUI.font;
		orte = Klassemanager.alleOrte();
	}	

	function update() {	
		Text.size=GUI.subSubTitleTextSize;
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;

		var cellw = 256;
		var cellh = 384;
		var cellmarginx = 30;
		var cellmarginy = 30;
		
		var klassen = Klassemanager.alleSpielbareKlassen();
		var klassenZahl = klassen.length;

		var s = S("Zielort","Destination");
		var th = Text.height(s);

		Text.display(Text.CENTER,GUI.screenPaddingTop,s);	

		for (i in 0...3) {
	  			var m = (Save.loadvalue("aufgeschlossen")) ;
				m++;
		}

		Gfx.linethickness=GUI.linethickness;
		var ty = Math.round(GUI.screenPaddingTop + th + GUI.buttonPaddingY);
		Gfx.drawline(0,ty,w,ty,PAL.buttonBorderCol);
		
		var colx = 600;
		Gfx.drawline(colx,ty,colx,h,PAL.fg);
		
		var bp = ty+GUI.buttonPaddingY*3;
		for (i in 0...orte.length){
			var o = orte[i];
			var oi:Ort = Klassemanager.orteklassen[Type.getClassName(o)];			

			if (i==state.ort){
				if (IMGUI.selectedbutton(cellmarginy*2,bp,oi.name.Eval() ) ) {
					
				}
			} else {
				if (IMGUI.button(0,bp,oi.name.Eval() ) ) {
					state.ort=i;
				}
			}
			bp+=200;
		}

		if (IMGUI.button(
				0,
				h-GUI.buttonTextSize-15*GUI.buttonPaddingY,
				S("Zurück","Back"))
			) {
			Scene.change(CharakterAuswahl);
		}

		var bs : ort.Ort = Klassemanager.ortBeispiel(orte[state.ort]);
		var ty3 = ty+4*cellmarginy;

		var posl = colx+4*cellmarginy;

		var bildref = "bilder/"+bs.bild;
		Gfx.drawimage(posl,ty3,bildref);

		ty3+=Gfx.imageheight(bildref)+4*cellmarginy;

		Text.size=GUI.subSubTitleTextSize;
		Text.display(posl,ty3,bs.name.Eval());
		var ty4=ty3+Text.size+2*cellmarginy;
		
		Text.size = GUI.textsize;
		Text.display(posl,ty4,bs.beschreibung.Eval(),PAL.fg);
	

		Text.size=GUI.buttonTextSize;
		var stext = S("Vormarsch!","Onwards!");
		if (IMGUI.button(			
				w-Math.round(Text.width(stext))-2*GUI.buttonPaddingX-4,
				h-GUI.buttonTextSize-15*GUI.buttonPaddingY,
				stext)
			) {
			Scene.change(szene.Oberwelt);
		}		
	}
}
