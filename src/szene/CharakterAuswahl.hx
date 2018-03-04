package szene;

import haxegon.*;
import Globals.*;
import utils.*;

class CharakterAuswahl {

	function init(){
		Text.font = GUI.font;
	}	

	function update() {	
		Text.size=GUI.subSubTitleTextSize;
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;

		var cellw = 256;
		var cellh = 384;
		var cellmarginx = 30;
		var cellmarginy = 30;
		
		var klassen = Klassemanager.AlleSpielbareKlassen();
		var klassenZahl = klassen.length;

		var s = S("Heldenauswahl","Hero Selection");
		var th = Text.height(s);

		Text.display(Text.CENTER,GUI.screenPaddingTop,s);	

		for (i in 0...3) {
	  			var m = (Save.loadvalue("aufgeschlossen")) ;
				m++;
		}

		Gfx.linethickness=GUI.linethickness;
		var ty = Math.round(GUI.screenPaddingTop + th + GUI.buttonPaddingY);
		Gfx.drawline(0,ty,w,ty,PAL.buttonBorderCol);
		var ty2 = ty + cellmarginy*2 + cellh;
		Gfx.drawline(0,ty2,w,ty2,PAL.buttonBorderCol);

		var imageselectionwidth = cellw*klassenZahl+cellmarginx*(klassenZahl-1);

		var l = Math.round(w/2-imageselectionwidth/2);

		for (i in 0...klassenZahl){			
			var m = klassen[i];
			var t : klasse.Klasse = Klassemanager.klasseBeispiel(m);
			var bump = 0;
			if (state.auserwaehlte==i){
				bump +=cellmarginy*2;
			}
			if (IMGUI.Bildbutton(
				l+(cellw+cellmarginx)*i,
				ty+cellmarginy+bump,
				"bilder/"+t.bild,
				state.auserwaehlte==i
				)){
					trace("clicked");
					state.auserwaehlte=i;
				}

		}

		var bs : klasse.Klasse = Klassemanager.klasseBeispiel(klassen[state.auserwaehlte]);

		var ty3 = ty2+4*cellmarginy;


		Text.size=GUI.subSubTitleTextSize;
		Text.display(Text.CENTER,ty3,bs.name.Eval());
		var ty4=ty3+Text.size+2*cellmarginy;
		
		Text.size = GUI.textsize;
		Text.display(20,ty4,bs.beschreibung.Eval(),PAL.fg);
	
		if (IMGUI.button(
				0,
				h-GUI.buttonTextSize-8*GUI.buttonPaddingY,
				S("Zurück","Back"))
			) {
			Scene.change(Main);
		}

		Text.size=GUI.buttonTextSize;
		if (IMGUI.button(
				w-Math.round(Text.width(S("Vormarsch!","Onwards")))-2*GUI.buttonPaddingX-4,
				h-GUI.buttonTextSize-8*GUI.buttonPaddingY,
				S("Vormarsch!","Onwards!"))
			) {
			//Scene.change(szene.Main);
		}		
	}
}
