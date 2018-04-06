package szene;

class OrtAuswahl {

	function init(){
		Text.font = GUI.font;
	}	

	function update() {	
		Gfx.clearscreen(PAL.bg);
		Text.size=GUI.subSubTitleTextSize;
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;

		// var cellw = 128;
		// var cellh = 129;
		// var cellmarginx = 15;
		var cellmarginy = 15;
		
		// var klassen = KreaturenSpielbar;
		// var klassenZahl = klassen.length;

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
		
		var colx = 300;
		Gfx.drawline(colx,ty,colx,h,PAL.fg);
		
		var bp = ty+GUI.buttonPaddingY*3;
		for (i in 0...Orte.length){
			var oi = Orte[i];

			if (i==state.ort){
				if (IMGUI.selectedbutton(cellmarginy*2,bp,oi.druckname.Eval() ) ) {
					
				}
			} else {
				if (IMGUI.button(0,bp,oi.druckname.Eval() ) ) {
					state.ort=i;
				}
			}
			bp+=100;
		}

		if (IMGUI.button(
				0,
				h-GUI.buttonTextSize-7*GUI.buttonPaddingY,
				S("Zurück","Back"))
			) {
			Scene.change(CharakterAuswahl);
		}

		var bs : ort.Ort = Orte[state.ort];
		var ty3:Float = ty+4*cellmarginy;

		var posl = colx+4*cellmarginy;

		var bildref = bs.bild;
		Gfx.scale(0.5,0.5);
		Gfx.drawimage(posl,ty3,bildref);
		Gfx.scale();

		ty3+=Gfx.imageheight(bildref)*0.5+4*cellmarginy;

		Text.size=GUI.subSubTitleTextSize;
		Text.display(posl,ty3,bs.druckname.Eval());
		var ty4=ty3+Text.size+2*cellmarginy;
		
		Text.size = GUI.textsize;
		Text.display(posl,ty4,bs.beschreibung.Eval(),PAL.fg);
	

		Text.size=GUI.buttonTextSize;
		var stext = S("Vormarsch!","Onwards!");
		if (IMGUI.button(			
				w-Math.round(Text.width(stext))-2*GUI.buttonPaddingX-4,
				h-GUI.buttonTextSize-7*GUI.buttonPaddingY,
				stext)
			) {

			SetupNewGame();
			Scene.change(szene.Oberwelt);
		}	
		
	}

	public function SetupNewGame(){
		state.owd = new OberweltData(Orte[state.ort]);
		var spielerklasse = KreaturenDictionary[ KreaturenSpielbar[state.auserwaehlte]];
		state.dyn = new KlasseDynamisch(spielerklasse,spielerklasse.ruestung);	

		for (i in 0...CONST.invW){
			for (j in 0...CONST.invH){
				if (state.dyn.platz[i][j]){
					state.owd.dat[i][j]=null;
				}
			}
		}			
	}
}
