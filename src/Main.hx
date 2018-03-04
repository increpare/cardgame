import haxegon.*;
import Globals.*;
import haxe.rtti.Meta;

class Main {
	// These fonts are located in the data/fonts/ directory.
	
	// Haxegon supports both TrueType fonts (which are high resolution and anti aliased)
	// or Bitmap fonts (which are crisp and good for low resolutions). This demo
	// shows truetype fonts only.
	
	
	
	function init(){
		//Truetype fonts look a LOT better when we don't scale the canvas!
		Gfx.resizescreen(0, 0);
		Text.font = GUI.font;

		//initial all globals here

		state.language = Save.loadvalue("language");
		if (state.language==0){
			state.language=0;//ok does't do much			
		}
		//var r = new klasse.Ritter();
		//var r = new klasse.Bauer();
		
		CompileTime.importPackage("klasse");
        var klassen = CompileTime.getAllClasses("klasse",klasse.Klasse);
		for ( k in klassen ) {
			trace(k);
			
			var statics = Meta.getType(k);
			trace(statics);
			if (Reflect.hasField(statics,"playable"))
			{
				trace("playable :D");
			}
		}	
	}
	
	function drawPairButton(x,y,text1,text2,selection:Int) {
		var oldtextsize=Text.size;
		Text.size = GUI.buttonTextSize;
		
	  var textcolor =PAL.buttonTextCol;
	  var color = PAL.buttonCol;
	  var colorhover = PAL.buttonHighlightCol;
	  var colorhover2:Int = PAL.buttonHighlightCol2;
	  var borderCol = PAL.buttonBorderCol;
	  var lightbgcol = PAL.buttonTextCol;
	  var linethickness=GUI.linethickness;
	  var xpadding = GUI.buttonPaddingX;
	  var ypadding = GUI.buttonPaddingY;

	  Gfx.linethickness=linethickness;

	  var width=39;
	  var w1 = Math.round(Text.width(text1));
	  var w2 = Math.round(Text.width(text1));
	  var w = w1+w2+xpadding*2;
	  if (w+6>=width){
	  	width=w+6;
	  }
	  width+=xpadding*2;

	  var height=Math.round(Math.max(Text.height(text1),Text.height(text2)));
	  if (x==Text.CENTER){
		  x=Math.round(Gfx.screenwidthmid-width/2);
	  }
	  height+=ypadding*2;

	  var dx = Mouse.x-x;
	  var dy = Mouse.y-y;

	  var collide = !(dx<0||dx>=width||dy<0||dy>=height);

	  var click = collide && Mouse.leftclick();

	  if (collide){
	    color=colorhover;
		lightbgcol = colorhover2;
	  }
	  Gfx.fillbox(x,y,width,height,color);
	  if (selection==1){
		  Gfx.fillbox(x,y,w1+2*xpadding,height,lightbgcol);
	  } else {
		  Gfx.fillbox(x+w1+2*xpadding,y,x+width-(x+w1+2*xpadding),height,lightbgcol);
	  }

	  Gfx.drawbox(x,y,width,height,borderCol);

	  Text.display(x+xpadding, y+ypadding, text1, selection==0?textcolor:PAL.buttonCol);
	  Text.display(x+xpadding+w1+xpadding*2, y+ypadding,text2,selection==1?textcolor:PAL.buttonCol);

	  Text.size=oldtextsize;

	  return click;
	}

	function drawButton(x,y,text) {
		var oldtextsize=Text.size;
		Text.size = GUI.buttonTextSize;
		
	  var textcolor =PAL.buttonTextCol;
	  var color = PAL.buttonCol;
	  var colorhover = PAL.buttonHighlightCol;
	  var borderCol = PAL.buttonBorderCol;

	  var linethickness=GUI.linethickness;
	  var xpadding = GUI.buttonPaddingX;
	  var ypadding = GUI.buttonPaddingY;

	  Gfx.linethickness=linethickness;

	  var width=39;
	  var w = Math.round(Text.width(text));
	  if (w+6>=width){
	  	width=w+6;
	  }
	  width+=xpadding*2;

	  var height=Math.round(Text.height(text));
	  if (x==Text.CENTER){
		  x=Math.round(Gfx.screenwidthmid-width/2);
	  }
	  height+=ypadding*2;

	  var dx = Mouse.x-x;
	  var dy = Mouse.y-y;

	  var collide = !(dx<0||dx>=width||dy<0||dy>=height);

	  var click = collide && Mouse.leftclick();

	  if (collide&& !click){
	    color=colorhover;
	  }

	  Gfx.fillbox(x,y,width,height,color);
	  Gfx.drawbox(x,y,width,height,borderCol);

	  Text.display(x+xpadding, y+ypadding, text, textcolor);
	  Text.size=oldtextsize;

	  return click;
	}

	function update() {	
		// Draw a white background
		Gfx.clearscreen(PAL.bg);
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;
		Text.wordwrap=w;

		Text.size=GUI.titleTextSize;
		Text.display(Text.CENTER,h/5,S("Ruestung","Ruestung"), PAL.titelFarbe);

		if (drawButton( Text.CENTER,Math.round(h/2+80),S("Zu einer Reise aufbrechen","Set off on an Adventure"))){
			Scene.change(CharacterSelect);
		}

		if (drawPairButton( Text.CENTER,Math.round(h/2+GUI.buttonTextSize*2.0+80),
		S("Deutsch","German"),
		S("Englisch","English"),
		1-state.language)){
			state.language=1-state.language;
			Save.savevalue("language",state.language);
		}

		Text.size=1;
		
	}
}
