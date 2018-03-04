package szene;

import haxegon.*;
import Globals.*;

class CharakterAuswahl {

	function init(){
		Text.font = GUI.font;
	}	

	function update() {	
		Text.size=GUI.subTitleTextSize;
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;

		var cellw = 128;
		var cellh = 256;
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
		var ty = GUI.screenPaddingTop + th + GUI.buttonPaddingY;
		Gfx.drawline(0,ty,w,ty,PAL.buttonBorderCol);


		var imageselectionwidth = cellw*klassenZahl+cellmarginx*(klassenZahl-1);

		var l = w/2-imageselectionwidth/2;

		for (i in 0...klassenZahl){
			trace(i);
			trace([l+(cellw+cellmarginx)*i,ty+cellmarginy,cellw,cellh,PAL.buttonBorderCol]);
			Gfx.drawbox(l+(cellw+cellmarginx)*i,ty+cellmarginy,cellw,cellh,PAL.buttonBorderCol);
		}


	}
}
