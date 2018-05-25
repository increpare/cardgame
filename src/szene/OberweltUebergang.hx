package szene;


class OberweltUebergang {

	public var maxZeit:Float;
	var zeit:Float;
	var spriteAlpha:Float;
	public var pc:Float;
	public static inline var c_border:Int=20;
	public static inline var c_border_sm:Int=10;

	var owd:OberweltData;
	var ort:Ort;
	var spielerklasse:Kreatur;
	var spielerklassedynamisch:KlasseDynamisch;

	var gegnerklasse:Kreatur;
	var gegnerklassedynamisch:KlasseDynamisch;


	public var dp_w:Float;
	
	public var map_x:Float;
	public var map_y:Float;
	public var map_w:Float;
	public var map_h:Float;

	public var map_x_inner:Float;
	public var map_y_inner:Float;
	public var map_w_inner:Float;
	public var map_h_inner:Float;
	public var details_y:Float;


	public var ex:Float;
	public var ey:Float;
	public var ew:Float;
	public var eh:Float;

	public var gegner_name:String;
	public var gegner_x:Float;
	public var gegner_y:Float;
	public var gegner_scale:Float;



	function drawDetailsPanel(ox:Float,oy:Float,klasse:Kreatur,klasseDynamisch:KlasseDynamisch,hidePortrait:Bool):Float{
		Gfx.linethickness = GUI.slimlinethickness;
		Text.size=GUI.smalltextsize;
		var bild = klasse.bild;
		var ih = Gfx.imageheight(bild);
		var iw = Gfx.imagewidth(bild);
		Text.display(ox,oy,klasse.druckname.Eval(),PAL.fg);
		oy+=Math.round(Text.size)+GUI.vpadding;
		if (!hidePortrait){
			Gfx.drawimage(ox,oy,bild);
		}
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

	function drawWorldMap(x:Float, y:Float, w:Float, h:Float){
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		Gfx.linethickness = GUI.linethickness + (GUI.slimlinethickness-GUI.linethickness)*pc;

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
					tile="sprites/blank2";
					Gfx.drawimage(cx,cy,tile);
					if (owd.visibleTile(i,j))
					{
						Gfx.imagealpha=spriteAlpha;
						tile=owd.dat[i][j].bild;
						if (i==state.tx && j==state.ty){

						} else {
							Gfx.drawimage(cx,cy,tile);
						}
							Gfx.imagealpha=1;
					}
				} else {		
				//if dark, is dark
					Gfx.drawimage(cx,cy,tile);
					Gfx.imagealpha=1;
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

function zeichnInventar(x:Float, y:Float, w:Float, h:Float,dyn:KlasseDynamisch){
		Gfx.linethickness = GUI.slimlinethickness;
		var areaAspect = w/h;
		var gridAspect = CONST.invW/CONST.invH;		

		var lightx=-1;
		var lighty=-1;


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
	}
	
	function zeichnHaufen(ox:Float,oy:Float,w:Int,h:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch){		

		Gfx.fillbox(ox,oy,w,h,PAL.bg);

		Gfx.drawbox(ox,oy,w,h,PAL.fg);
	}

	function zeichnSchlange(ox:Float,oy:Float,w:Int,h:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch){
		Gfx.linethickness = GUI.linethickness;
		var r:Int=Math.round(w/3);
		Gfx.fillcircle(ox+w/2,oy+r,r,PAL.bg);
		Gfx.drawcircle(ox+w/2,oy+r,r,PAL.fg);

		var schlangelaenge = 0;
		var rest = Math.max(schlangelaenge-CONST.schlangelaenge,0);
		var s:String = Std.string(rest);

		Text.size = GUI.smalltextsize;
		//draw number of extra cards in pile here
		var tw = Text.width(s);
		var th = Text.height(s);

		var tx = ox+w/2-tw/2;
		var ty = oy+r-th;

		//Text.display(tx,ty,s,PAL.fg);

		oy+=r;
		h-=r;

		Gfx.fillbox(ox,oy,w,h,PAL.bg);

		Gfx.linethickness = GUI.slimlinethickness;

		var bwidth=w;
		var bheight:Float = h/CONST.schlangelaenge;
		for (i in 0...CONST.schlangelaenge){

			//position from bottom
			var invindex = CONST.schlangelaenge-i-1;

			if (i<CONST.schlangelaenge-1){
				Gfx.drawline(ox+3,oy+bheight*(i+1),ox-3+w,oy+bheight*(i+1),PAL.fg);
			}
		}
		Gfx.scale(1);
		Gfx.linethickness=GUI.linethickness;

		Gfx.drawbox(ox,oy,w,h+Gfx.linethickness/2+2,PAL.fg);
	}

	function reset(){
		init();
	}

	function init(){	

		maxZeit=0.5;
		zeit=0;
		spriteAlpha=1.0;
		pc=0;

		ort = Orte[state.ort];
		owd=state.owd;
		zeit=0;

		spielerklasse = KreaturenDictionary[KreaturenSpielbar[state.auserwaehlte]];
		spielerklassedynamisch = state.dyn;		

		gegnerklasse = state.owd.dat[state.tx][state.ty];
		gegnerklassedynamisch = new KlasseDynamisch(gegnerklasse,gegnerklasse.ruestung);
		
		
		dp_w = drawDetailsPanel(c_border_sm,c_border_sm,spielerklasse,spielerklassedynamisch,false);


		map_x = c_border_sm+dp_w+c_border;
		map_y = c_border;
		map_w = Gfx.screenwidth - map_x - c_border;
		map_h = Gfx.screenheight - map_y - c_border;


		var t_map_x = c_border_sm+dp_w+c_border;
		var t_map_y = c_border + Gfx.screenheightmid;
		var t_map_w = Gfx.screenwidth - t_map_x - c_border;
		var t_map_h = Gfx.screenheight - t_map_y - c_border;

		var schlangewidth=100;

		t_map_x+=schlangewidth+10;
		t_map_w-=schlangewidth+10;
		
		t_map_w-=schlangewidth+10;

		details_y=c_border_sm;
		

		var map_x_inner = map_x + GUI.linethickness*2;
		var map_y_inner = map_y + GUI.linethickness*2;
		var map_w_inner = map_w - GUI.linethickness*4;
		var map_h_inner = map_h - GUI.linethickness*4;
		

		var cell = getGridCoord(state.tx,state.ty,map_x_inner,map_y_inner,map_w_inner,map_h_inner);

		var s = cell.size/Gfx.imagewidth("sprites/_");
		
		gegner_name = state.owd.dat[state.tx][state.ty].bild;
		gegner_x = cell.x;
		gegner_y = cell.y;
		gegner_scale = s;
		
		var gegner_x_ziel = Math.floor(Gfx.screenwidth-c_border_sm-dp_w);
		var gegner_y_ziel = c_border_sm + Math.round(Text.size)+GUI.vpadding;
		var gegner_scale_ziel = 1.0;
		
		Actuate.tween(
			this,
			maxZeit,
				{
					details_y:Gfx.screenheightmid+c_border_sm,
					map_x:t_map_x,
					map_y:t_map_y,
					map_w:t_map_w,
					map_h:t_map_h,
					spriteAlpha:0,
					gegner_x:gegner_x_ziel,
					gegner_y:gegner_y_ziel,
					gegner_scale:gegner_scale_ziel,
					pc:1
				}
			).ease(motion.easing.Quad.easeOut);

			Core.delaycall(
				function() {
					Gfx.drawtoimage("sshot");
					update();
					Gfx.drawtoscreen();
					Scene.change(Schlacht);				
				},
				maxZeit+0.1
			);
	}	

	function update() {	
		var delta:Float = 1/Core.fps;
		Gfx.clearscreen(PAL.bg);
		
		Gfx.linethickness = GUI.slimlinethickness;
		Gfx.drawline(0,Gfx.screenheightmid*pc,Gfx.screenwidth,Gfx.screenheightmid*pc,PAL.fg);
		
		var my = Gfx.screenheightmid;
		var sw = Gfx.screenwidth;
		var sh = Gfx.screenheight;

		var width = drawDetailsPanel(c_border_sm,details_y,spielerklasse,spielerklassedynamisch,false);
		
		var border = c_border;
		
		var bounds = getBoxBounds(map_x,map_y,map_w,map_h);


		//SPIELER1 - specifisch sachen
		{
			var schlangewidth=100;
			var buttonheight=30;	
			
			var x = 10+width+border;
			var y = my+border;
			var w = Gfx.screenwidth - x - border;
			var h = Gfx.screenheight - y - border;

			zeichnSchlange(10 + width + 10,my+10+my*(1-pc),schlangewidth,h, spielerklasse,spielerklassedynamisch);

			var haufen_x=sw-10-schlangewidth;
			var haufen_y=my+10;
			var haufen_w=schlangewidth;
			var haufen_h=h-buttonheight;
			zeichnHaufen(haufen_x,my+10+my*(1-pc),schlangewidth,h-buttonheight, spielerklasse,spielerklassedynamisch);

			IMGUI.kleineSchaltflaeche(
				sw-schlangewidth-10,
				sh-buttonheight-10+my*(1-pc),
				schlangewidth,
				buttonheight,
				S("Zug fertig","End Turn"),
				true);
				
		}

		//SPIELER2 - specifische sachen
		{
			var schlangewidth=100;
			var buttonheight=30;	
			
			var border = 20;
			var x = border;
			var y = border;
			var w = Gfx.screenwidth - x - border-width-10;
			var h = my - y - border;

			var width = drawDetailsPanel(Math.floor(sw-(10+width)*pc),10,gegnerklasse,gegnerklassedynamisch,true);

			zeichnSchlange(
				Math.floor(sw-10-width-schlangewidth-10),
				10-(10+h)*(1-pc),
				schlangewidth,
				h,
				gegnerklasse,
				gegnerklassedynamisch
				);

			w-=schlangewidth+10;
			var haufen_x=sw-10-schlangewidth;
			var haufen_y=my+10;
			var haufen_w=schlangewidth;
			var haufen_h=h-buttonheight;

			zeichnHaufen(
				10,
				10-(10+h)*(1-pc),
				schlangewidth,
				h, 
				spielerklasse,
				spielerklassedynamisch
				);

			x+=schlangewidth+10;
			w-=schlangewidth+10;

			var bounds = getBoxBounds(x,y-(y+h)*(1-pc),w,h);

			Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
			x+=GUI.linethickness*2;
			y+=GUI.linethickness*2;
			w-=GUI.linethickness*4;
			h-=GUI.linethickness*4;
		
			zeichnInventar(x,y-(y+h)*(1-pc),w,h,gegnerklassedynamisch);		
		}

		Gfx.linethickness = GUI.linethickness;
		
		Gfx.fillbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.bg);
		Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
		var map_x_inner = map_x + GUI.linethickness*2;
		var map_y_inner = map_y + GUI.linethickness*2;
		var map_w_inner = map_w - GUI.linethickness*4;
		var map_h_inner = map_h - GUI.linethickness*4;
		
		drawWorldMap(map_x_inner,map_y_inner,map_w_inner,map_h_inner);	

		Gfx.scale(gegner_scale);
		Gfx.drawimage(gegner_x,gegner_y,gegner_name);
		Gfx.scale(1);
		
		zeit+=delta;

	}
}
