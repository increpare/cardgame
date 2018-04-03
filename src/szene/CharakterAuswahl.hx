package szene;

class CharakterAuswahl {

	function init(){
		Text.font = GUI.font;
	}	

	function update() {	
		Gfx.clearscreen(PAL.bg);

		Text.size=GUI.subSubTitleTextSize;
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;

		var cellw = 128;
		var cellh = 128;
		var cellmarginx = 15;
		var cellmarginy = 15;
		
		var klassen = KreaturenSpielbar;
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
			var t : klasse.Klasse = KreaturenDictionary[KreaturenSpielbar[i]];
			var bump = 0;
			if (state.auserwaehlte==i){
				bump +=cellmarginy*2;
			}
			if (IMGUI.Bildbutton(
				l+(cellw+cellmarginx)*i,
				ty+cellmarginy+bump,
				t.bild,
				state.auserwaehlte==i,
				0.5
				)){
					state.auserwaehlte=i;
				}

		}

		var bs : klasse.Klasse = KreaturenDictionary[KreaturenSpielbar[state.auserwaehlte]];

		var ty3 = ty2+2*cellmarginy;

		Text.size=GUI.subSubTitleTextSize;
		Text.display(Text.CENTER,ty3,bs.druckname.Eval());
		var ty4=ty3+Text.size+2*cellmarginy;
		
		Text.size = GUI.textsize;
		Text.display(20,ty4,bs.beschreibung.Eval(),PAL.fg);
	
		if (IMGUI.button(
				0,
				h-GUI.buttonTextSize-7*GUI.buttonPaddingY,
				S("Zurück","Back"))
			) {
			Scene.change(Main);
		}

		Text.size=GUI.buttonTextSize;

		var stext = S("Vormarsch!","Onwards!");
		if (IMGUI.button(			
				w-Math.round(Text.width(stext))-2*GUI.buttonPaddingX-4,
				h-GUI.buttonTextSize-7*GUI.buttonPaddingY,
				stext)
			) {
			Scene.change(szene.OrtAuswahl);
		}		
	}
}
