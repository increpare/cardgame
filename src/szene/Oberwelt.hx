package szene;

import haxegon.*;
import Globals.*;
import ort.*;
import klasse.*;
import fertigkeit.*;
import szene.*;
import utils.*;

class Oberwelt {

	var owd:OberweltData;
	var ort:Ort;
	var spielerklasse:Klasse;

	function init(){
		owd = new OberweltData();
		Text.font = GUI.font;

		var spielerklassetypen = Lambda.array(CompileTime.getAllClasses(Klasse));
		var spielerklassetyp = spielerklassetypen[state.auserwaehlte];
		spielerklasse = Type.createInstance(spielerklassetyp,[]);

		var orttypen = Lambda.array(CompileTime.getAllClasses(Ort));
		var orttyp = orttypen[state.ort];
		ort = Type.createInstance(orttyp,[]);
	}	

	function drawDetailsPanel(ox:Int,oy:Int,klasse:Klasse):Float{
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
		return iw;
	}

	function gridCollision(mx:Float,my:Float,x:Float,y:Float,w:Float,h:Float):Dynamic{
	
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var xoffset:Float=0;
		var yoffset:Float=0;

		var cellsize:Float=0;
		if (areaAspect>gridAspect){//if screen is wider than inventory
			//need to center horizontally
			cellsize=h/CONST.invH;
			var xoffset = w/2-(cellsize*CONST.invW)/2;
			x += xoffset;
			w = CONST.invW*cellsize;
		} else {
			//need to center vertically
			cellsize=w/CONST.invW;
			var yoffset = h/2-cellsize*(CONST.invH)/2;
			y+=yoffset;
			h = CONST.invH*cellsize;
		}

		mx -= x;
		my -= y;

		mx/=cellsize;
		my/=cellsize;

		mx = Math.floor(mx);
		my = Math.floor(my);
		
		if (mx<0||mx>=CONST.invW || my<0||my>=CONST.invH){
			return null;
		}
		return {
			x:mx,
			y:my
		};

	}

	function getGridCoord(i:Int,j:Int,x:Float,y:Float,w:Float,h:Float):Dynamic{
	
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var xoffset:Float=0;
		var yoffset:Float=0;

		var cellsize:Float=0;
		if (areaAspect>gridAspect){//if screen is wider than inventory
			//need to center horizontally
			cellsize=h/CONST.invH;
			var xoffset = w/2-(cellsize*CONST.invW)/2;
			x += xoffset;
			w = CONST.invW*cellsize;
		} else {
			//need to center vertically
			cellsize=w/CONST.invW;
			var yoffset = h/2-cellsize*(CONST.invH)/2;
			y+=yoffset;
			h = CONST.invH*cellsize;
		}

		var ix = x+i*w/CONST.invW;
		var iy = y+j*h/CONST.invH;

		return {
			x:ix,
			y:iy,
			size:cellsize
		};
	}

	function drawWorldMap(x:Float, y:Float, w:Float, h:Float){
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var xoffset:Float=0;
		var yoffset:Float=0;

		var cellsize:Float=0;
		if (areaAspect>gridAspect){//if screen is wider than inventory
			//need to center horizontally
			cellsize=h/CONST.invH;
			var xoffset = w/2-(cellsize*CONST.invW)/2;
			x += xoffset;
			w = CONST.invW*cellsize;
		} else {
			//need to center vertically
			cellsize=w/CONST.invW;
			var yoffset = h/2-cellsize*(CONST.invH)/2;
			y+=yoffset;
			h = CONST.invH*cellsize;
		}


		var s = cellsize/GUI.portraitsize;
		Gfx.scale(s,s,Gfx.LEFT,Gfx.TOP);
		//Gfx.drawbox(x,y,w,h,PAL.fg);		
		for (i in 0...CONST.invW){
			for (j in 0...CONST.invH){
				var cx = x+cellsize*i;
				var cy = y+cellsize*j;
				Gfx.drawimage(cx,cy,Kreaturen[i+CONST.invH*j].img);
			}
		}
		Gfx.scale();

		for (i in 0...(CONST.invH+1) ){
			var r = i/CONST.invH;
			Gfx.drawline(
					x,
					y+r*h,
					x+w,
					y+r*h,
					PAL.bg);
		}

		for (j in 0...(CONST.invW+1) ){
			var r = j/CONST.invW;
			Gfx.drawline(
					x+r*w,
					y,
					x+r*w,
					y+h,
					PAL.bg);
		}
	}

	function update() {	
		var width = drawDetailsPanel(10,10,spielerklasse);
		var border = 20;
		var x = 10+width+border;
		var y = border;
		var w = Gfx.screenwidth - x - border;
		var h = Gfx.screenheight - y - border;

		drawWorldMap(x,y,w,h);		


		var mc = gridCollision(Mouse.x,Mouse.y,x,y,w,h);
		if (mc!=null){
			var cell = getGridCoord(mc.x,mc.y,x,y,w,h);
			Gfx.linethickness=GUI.thicklinethickness;
			Gfx.drawbox(cell.x,cell.y,cell.size,cell.size,Col.ORANGE);
			Gfx.linethickness=GUI.linethickness;
			trace(cell.x,cell.y);
		}
	}
}
