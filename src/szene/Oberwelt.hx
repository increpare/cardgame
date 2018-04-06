package szene;


class Oberwelt {

	var owd:OberweltData;
	var ort:Ort;
	var spielerklasse:Kreatur;
	var spielerklassedynamisch:KlasseDynamisch;

	function init(){		
		ort = Orte[state.ort];
		owd=state.owd;
		Text.font = GUI.font;
		spielerklasse = KreaturenDictionary[KreaturenSpielbar[state.auserwaehlte]];
		spielerklassedynamisch = state.dyn;
	}	


	function drawDetailsPanel(ox:Int,oy:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch):Float{
		Text.size=GUI.smalltextsize;
		var bild = klasse.bild;
		var ih = Gfx.imageheight(bild);
		var iw = Gfx.imagewidth(bild);
		Text.display(ox,oy,klasse.druckname.Eval(),PAL.fg);
		oy+=Math.round(Text.size)+GUI.vpadding;
		Gfx.drawimage(ox,oy,bild);
		oy+=ih+GUI.vpadding;
		var hpc:Float = klasseDynamisch.gesundheit/klasseDynamisch.maxGesundheit;
		var hpstring = klasseDynamisch.gesundheit+"/"+klasseDynamisch.maxGesundheit;
		Gfx.fillbox(ox,oy,iw,Text.size+20,PAL.bg);
		Gfx.fillbox(ox,oy,iw*hpc,Text.size+20,Col.RED);
		Gfx.drawbox(ox,oy,iw,Text.size+20,PAL.fg);
		Text.display(ox+20,oy+4,hpstring,PAL.fg);
		return iw;
	}

	function gridCollision(mx:Float,my:Float,x:Float,y:Float,w:Float,h:Float):IntPair{
	
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		// var xoffset:Float=0;
		// var yoffset:Float=0;

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
			x:Math.floor(mx),
			y:Math.floor(my)
		};

	}

	function getGridCoord(i:Int,j:Int,x:Float,y:Float,w:Float,h:Float):Dynamic{
	
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		// var xoffset:Float=0;
		// var yoffset:Float=0;

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



	function getBoxBounds(x:Float,y:Float,w:Float,h:Float):Dynamic{
	
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		// var xoffset:Float=0;
		// var yoffset:Float=0;

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

		return [x,y,w,h];
	}

	function drawWorldMap(x:Float, y:Float, w:Float, h:Float,mc:Dynamic){
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var lightx=-1;
		var lighty=-1;
		if (mc!=null){
			lightx=mc.x;
			lighty=mc.y;
		}

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


		var s = cellsize/Gfx.imagewidth("sprites/_");
		Gfx.scale(s,s);
		//Gfx.drawbox(x,y,w,h,PAL.fg);		
		for (i in 0...CONST.invW){
			for (j in 0...CONST.invH){
				var cx = x+cellsize*i;
				var cy = y+cellsize*j;
				
				//if cleared, is blank
				var tile="sprites/_";
				
				//otherwise, monster
				if (owd.dat[i][j]!=null){
					if (owd.visibleTile(i,j))
					{
						tile=owd.dat[i][j].bild;
					}
					else {
						tile="sprites/blank2";
					}
				}
				
				//if dark, is dark

				if (i==lightx && j==lighty){
					Gfx.imagealpha=0.6;
					Gfx.drawimage(cx,cy,tile);
					Gfx.imagealpha=1.0;
				} else {
					Gfx.drawimage(cx,cy,tile);
				}
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
		Gfx.clearscreen(PAL.bg);
		var width = drawDetailsPanel(10,10,spielerklasse,spielerklassedynamisch);
		var border = 20;
		var x = 10+width+border;
		var y = border;
		var w = Gfx.screenwidth - x - border;
		var h = Gfx.screenheight - y - border;

		var mc = gridCollision(Mouse.x,Mouse.y,x,y,w,h);

		var bounds = getBoxBounds(x,y,w,h);

		Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
		x+=GUI.linethickness*2;
		y+=GUI.linethickness*2;
		w-=GUI.linethickness*4;
		h-=GUI.linethickness*4;
		
		drawWorldMap(x,y,w,h,mc);		

		if (mc!=null){
			var cell = getGridCoord(mc.x,mc.y,x,y,w,h);
			Gfx.linethickness=GUI.linethickness;
			Gfx.drawbox(cell.x,cell.y,cell.size,cell.size,PAL.buttonBorderCol);
			Gfx.linethickness=GUI.linethickness;
			
			if (owd.dat[mc.x][mc.y]!=null){
				if (owd.visibleTile(mc.x,mc.y)) {
					if (Mouse.leftclick()){
						state.tx=mc.x;
						state.ty=mc.y;
						Scene.change(Schlacht);
					}
				}
			}
		}
	}
}
