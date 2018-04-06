package szene;

class Schlacht {

	var owd:OberweltData;
	var ort:Ort;
	var spielerklasse:Kreatur;
	var spielerklassedynamisch:KlasseDynamisch;
	var zustand:KampfZustand;

	var gegnerklasse:Kreatur;
	var gegnerklassedynamisch:KlasseDynamisch;

	function mausInRechteck(bx:Float,by:Float,bw:Float,bh:Float):Bool{
		var mx = Mouse.x;
		var my = Mouse.y;
		return 
			bx <= mx && 
			mx <  bx+bw &&
			by <= my &&
			my < by+bh; 
	}

	function init(){		
		ort = Orte[state.ort];
		owd=state.owd;
		Text.font = GUI.font;

		spielerklasse = KreaturenDictionary[KreaturenSpielbar[state.auserwaehlte]];
		spielerklassedynamisch = state.dyn;	

		gegnerklasse = state.owd.dat[state.tx][state.ty];
		gegnerklassedynamisch = new KlasseDynamisch(gegnerklasse,gegnerklasse.ruestung);
		zustand = new KampfZustand(
			spielerklasse,
			gegnerklasse,
			spielerklassedynamisch,
			gegnerklassedynamisch
			);
	}	


	function drawDetailsPanel(ox:Int,oy:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch):Int{
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

	function zeichnSchlange(ox:Int,oy:Int,w:Int,h:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch,inv:Inventar){
		var r:Int=Math.round(w/3);
		Gfx.drawcircle(ox+w/2,oy+r,r,PAL.fg);

		var schlangelaenge = inv.schlange.length;
		var rest = Math.max(schlangelaenge-CONST.schlangelaenge,0);
		var s:String = Std.string(rest);

		Text.size = GUI.smalltextsize;
		//draw number of extra cards in pile here
		var tw = Text.width(s);
		var th = Text.height(s);

		var tx = ox+w/2-tw/2;
		var ty = oy+r-th;

		Text.display(tx,ty,s,PAL.fg);

		oy+=r;
		h-=r;

		Gfx.fillbox(ox,oy,w,h,PAL.bg);

		Gfx.linethickness = GUI.slimlinethickness;

		var bwidth=w;
		var bheight:Float = h/CONST.schlangelaenge;
		for (i in 0...CONST.schlangelaenge){

			//position from bottom
			var invindex = CONST.schlangelaenge-i-1;

			//if you have this item
			if (invindex<inv.schlange.length){

				var bild = "sprites/fragezeichen";
				if (invindex<klasseDynamisch.sichbareSlot){
					var ruestungname = inv.schlange[invindex];
					bild = RuestungenDictionary[ruestungname].bild;

					if (zustand.zug == inv.spieler)
					{

						if (zustand.ausgewaehltesabteil == invindex) {
							Gfx.fillbox(ox,oy+i*bheight,bwidth,bheight,PAL.bghighlight);
						}

						if (mausInRechteck(ox,oy+i*bheight,bwidth,bheight)){
							Gfx.drawbox(ox+6,oy+i*bheight+2,bwidth-12,bheight-4,PAL.fg);
							Gfx.imagealpha=0.6;

							if (Mouse.leftclick()){
								if (zustand.ausgewaehltesabteil != invindex){
									zustand.ausgewaehltesabteil = invindex;
								} else {
									zustand.ausgewaehltesabteil = -1;
								}								
							}
						}

						if (zustand.ausgewaehltesabteil == invindex) {
							Gfx.linethickness=GUI.linethickness;
							var box_x = Math.floor(ox+2*GUI.linethickness);
							var box_y = Math.floor(oy+i*bheight+GUI.linethickness+1);
							var box_w = Math.floor(bwidth-4*GUI.linethickness);
							var box_h = Math.floor(bheight-11);
							Gfx.drawbox(box_x,box_y,box_w,box_h,PAL.fg);
							Gfx.linethickness = GUI.slimlinethickness;
						}
					}
				}

				var iw:Float = Gfx.imagewidth(bild);
				var ih:Float = Gfx.imageheight(bild);
				var innerdiameter = Math.max(iw,ih);
				var outerdiameter = Math.min(bwidth,bheight);
				var scale = outerdiameter/innerdiameter;
				scale*=0.7;
				iw*=scale;
				ih*=scale;
				Gfx.scale(scale);
				var px = ox+bwidth/2-iw/2;
				var py = oy+bheight*i+bheight/2-ih/2;


				Gfx.drawimage(px,py,bild);
				Gfx.imagealpha=1;
				
			}//otherwise  it's empty, don't need to do anything

			if (i<CONST.schlangelaenge-1){
				Gfx.drawline(ox+3,oy+bheight*(i+1),ox-3+w,oy+bheight*(i+1),PAL.fg);
			}
		}
		Gfx.scale(1);
		Gfx.linethickness=GUI.linethickness;

		Gfx.drawbox(ox,oy,w,h+Gfx.linethickness/2+2,PAL.fg);
	}

	function zeichnHaufen(ox:Int,oy:Int,w:Int,h:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch,inv:Inventar){		

		Gfx.fillbox(ox,oy,w,h,PAL.bg);

		Gfx.drawbox(ox,oy,w,h,PAL.fg);
	}

	function gridCollision(mx:Float,my:Float,x:Float,y:Float,w:Float,h:Float):Dynamic{
	
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
			x:mx,
			y:my
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

	function zeichnInventar(x:Float, y:Float, w:Float, h:Float,mc:Dynamic,dyn:KlasseDynamisch,inv:Inventar){
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var lightx=-1;
		var lighty=-1;
		if (mc!=null && zustand.ausgewaehltesabteil==-1){
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
				if (dyn.platz[i][j]==false){
					tile="sprites/blank2";					
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

		for (i in 0...inv.placed.length){
			var p = inv.placed[i];
			var ruestung = RuestungenDictionary[p.name];
			var width = Gfx.imagewidth(ruestung.bild);

			var cell = getGridCoord(p.x,p.y,x,y,w,h);

			var scale = ruestung.w*cell.size/width;
			Gfx.scale(scale);
			Gfx.drawimage(cell.x,cell.y,ruestung.bild);
			Gfx.scale(1);

		}
	}

	function zeichnMarkierung(mc:Dynamic,x:Float,y:Float,w:Float,h:Float):Bool {
		if (zustand.zug!=0 || zustand.ausgewaehltesabteil==-1){
			return false;			
		}

		
		//first, item should be centered on cursor if possible

	
		var ruestungname = zustand.inv1.schlange[zustand.ausgewaehltesabteil];
		var ruestung = RuestungenDictionary[ruestungname];

		var cell = getGridCoord(mc.x,mc.y,x,y,w,h);

		//draw alphaed item
		Gfx.imagealpha=0.6;
		var width = Gfx.imagewidth(ruestung.bild);
		var scale = ruestung.w*cell.size/width;
		Gfx.scale(scale);
		Gfx.drawimage(cell.x,cell.y,ruestung.bild);
		Gfx.scale(1);
		Gfx.imagealpha=1.0;

		var result=true;
		Gfx.linethickness = GUI.slimlinethickness;
		for (i in 0...ruestung.w){
			for (j in 0...ruestung.h){
				if (ruestung.form[i][j]==1){
					var cx = cell.x+cell.size/2+i*cell.size;
					var cy = cell.y+cell.size/2+j*cell.size;
					if (zustand.dyn1.platz[mc.x+i][mc.y+j]){
						Gfx.drawcircle(cx,cy,cell.size/3,PAL.giltFarb);
					} else {
						Gfx.drawcircle(cx,cy,cell.size/3,PAL.schlechtFarb);
						result=false;
					}
				}
			}
		}
		Gfx.linethickness = GUI.linethickness;

		return result;
	}

	function placePiece(mc:Dynamic){
		var inv:Inventar = zustand.zug==0?zustand.inv1:zustand.inv2;
		var ruestungIndex = zustand.ausgewaehltesabteil;
		var ruestungName = inv.schlange[ruestungIndex];
		trace("removing "+ruestungName);
		inv.schlange.splice(ruestungIndex,1);
		zustand.ausgewaehltesabteil=-1;
		inv.placed.push({
							name:ruestungName, 
							x:mc.x,
							y:mc.y,
							rot:0
							});
	}

	function update() {	
		Gfx.clearscreen(PAL.bg);

		var my = Gfx.screenheightmid;

		var sw = Gfx.screenwidth;
		var sh = Gfx.screenheight;

		Gfx.drawline(0,my,sw,my,PAL.fg);


	
		var infopanelwidth:Float;
		var schlangewidth:Float;

		//you at front
		{
			var width = drawDetailsPanel(10,my+10,spielerklasse,spielerklassedynamisch);
			infopanelwidth=width;


			var border = 20;
			var x = 10+width+border;
			var y = my+border;
			var w = Gfx.screenwidth - x - border;
			var h = Gfx.screenheight - y - border;

			var schlangewidth=100;
			zeichnSchlange(10 + width + 10,my+10,schlangewidth,h, spielerklasse,spielerklassedynamisch,zustand.inv1);

			x+=schlangewidth+10;
			w-=schlangewidth+10;

			zeichnHaufen(sw-10-schlangewidth,my+10,schlangewidth,h, spielerklasse,spielerklassedynamisch,zustand.inv1);
			w-=schlangewidth+10;

			var mc = gridCollision(Mouse.x,Mouse.y,x,y,w,h);

			var bounds = getBoxBounds(x,y,w,h);

			Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
			x+=GUI.linethickness*2;
			y+=GUI.linethickness*2;
			w-=GUI.linethickness*4;
			h-=GUI.linethickness*4;
		
			zeichnInventar(x,y,w,h,mc,spielerklassedynamisch,zustand.inv1);		

			if (mc!=null){
				var cell = getGridCoord(mc.x,mc.y,x,y,w,h);
				//Gfx.linethickness=GUI.linethickness;
				//Gfx.drawbox(cell.x,cell.y,cell.size,cell.size,PAL.buttonBorderCol);
				//Gfx.linethickness=GUI.linethickness;

				if (zeichnMarkierung(mc,x,y,w,h)){
					if (Mouse.leftclick()){
						placePiece(mc);
					}
				}
			}
		}

		//enemy at top
		{	
			var width = drawDetailsPanel(Math.floor(sw-10-infopanelwidth),10,gegnerklasse,gegnerklassedynamisch);
			var border = 20;
			var x = border;
			var y = border;
			var w = Gfx.screenwidth - x - border-width-10;
			var h = my - y - border;


			var schlangewidth=100;
			zeichnSchlange(
				Math.floor(sw-10-infopanelwidth-schlangewidth-10),
				10,
				schlangewidth,
				h,
				gegnerklasse,
				gegnerklassedynamisch,
				zustand.inv2
				);

			w-=schlangewidth+10;

			zeichnHaufen(
				10,
				10,
				schlangewidth,
				h, 
				spielerklasse,
				spielerklassedynamisch,
				zustand.inv1
				);
			x+=schlangewidth+10;
			w-=schlangewidth+10;

			var mc = gridCollision(Mouse.x,Mouse.y,x,y,w,h);

			var bounds = getBoxBounds(x,y,w,h);

			Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
			x+=GUI.linethickness*2;
			y+=GUI.linethickness*2;
			w-=GUI.linethickness*4;
			h-=GUI.linethickness*4;
		
			zeichnInventar(x,y,w,h,mc,gegnerklassedynamisch,zustand.inv2);		
	
		}
	}
}
