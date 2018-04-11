package szene;
import motion.*;

class Schlacht {

	var owd:OberweltData;
	var ort:Ort;
	var spielerklasse:Kreatur;
	var spielerklassedynamisch:KlasseDynamisch;
	var zustand:KampfZustand;

	var gegnerklasse:Kreatur;
	var gegnerklassedynamisch:KlasseDynamisch;

	//animation stuff
	var cursorrot:Float=0;
	var portraitscale1:Float=1;
	var portraitscale2:Float=1;
	var extraschaden1:Float=0;
	var extraschaden2:Float=0;

	var haufenAnimation1:Bool=false;
	var haufenAnimation2:Bool=false;

	function cutscene():Bool{
		return haufenAnimation1||haufenAnimation2;
	}
	
	function mausInRechteck(bx:Float,by:Float,bw:Float,bh:Float):Bool{
		var mx = Mouse.x;
		var my = Mouse.y;
		return 
			bx <= mx && 
			mx <  bx+bw &&
			by <= my &&
			my < by+bh; 
	}

	var iconScale:Float;
	function init(){		
		ort = Orte[state.ort];
		owd=state.owd;
		Text.font = GUI.font;

		var introblend = SpriteManager.AddSprite("sshot",0,0);
	
		Actuate.tween(
			introblend,
			0.3,
				{alpha:0});

		Core.delaycall(
			function() {
				introblend.destroy();						
			},
			0.4
		);

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

        zustand.beginnZug();
	}	


	function drawDetailsPanel(ox:Int,oy:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch,schaden:Float,portraitscale:Float,extraschaden:Float,wein:Bool):Int{
		Gfx.linethickness = GUI.slimlinethickness;		
		Text.size=GUI.smalltextsize;
		var bild = klasse.bild;
		var ih = Gfx.imageheight(bild);
		var iw = Gfx.imagewidth(bild);
		Text.display(ox,oy,klasse.druckname.Eval(),PAL.fg);
		oy+=Math.round(Text.size)+GUI.vpadding;
		Gfx.scale(portraitscale,portraitscale,iw/2,ih/2);
		Gfx.drawimage(ox,oy,bild);
		Gfx.scale(1);

		if (wein){
			Traenen.bild = "traene";
			//trasformieren
			for (p in klasse.augen) {
				Traenen.AddPoint(ox+p.x,oy+p.y,0.5);
			}
		}

		oy+=ih+GUI.vpadding;
		var gesundheit = klasseDynamisch.gesundheit+extraschaden;
		var hpc:Float = gesundheit/klasseDynamisch.maxGesundheit;
		var hpstring = Math.round(gesundheit)+"/"+klasseDynamisch.maxGesundheit;
		Gfx.fillbox(ox,oy,iw,Text.size+20,PAL.bg);
		Gfx.fillbox(ox,oy,iw*hpc,Text.size+20,Col.RED);
		if (schaden>=0){
			var ds = (schaden+klasseDynamisch.gesundheit)/2;
			bloodAt(ox+iw*ds/klasseDynamisch.maxGesundheit,(oy+Text.size+20/2));
		}
		
		Gfx.drawbox(ox,oy,iw,Text.size+20,PAL.fg);
		Text.display(ox+20,oy+4,hpstring,PAL.fg);
		return iw;
	}

	function zeichnSchlange(ox:Int,oy:Int,w:Int,h:Int,klasse:Kreatur,klasseDynamisch:KlasseDynamisch,inv:Inventar){
		Gfx.linethickness = GUI.linethickness;
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
					var ruestungDyn = inv.schlange[invindex];
					var ruestungName = ruestungDyn.ruestung.name;
					
					bild = RuestungenDictionary[ruestungName].bild[ruestungDyn.rotation];

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

	function zeichnInventar(x:Float, y:Float, w:Float, h:Float,mc:IntPair,dyn:KlasseDynamisch,inv:Inventar){
		Gfx.linethickness = GUI.slimlinethickness;
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
			if (p.sprite==null){
				var ruestungDyn = p.ruestung;
				var ruestung = ruestungDyn.ruestung;
				var rot = ruestungDyn.rotation;
				var width = Gfx.imagewidth(ruestung.bild[p.ruestung.rotation]);

				var cell = getGridCoord(p.x,p.y,x,y,w,h);

				var scale = ruestung.w[rot]*cell.size/width;
				var spritename = ruestung.bild[p.ruestung.rotation];
				var s = SpriteManager.AddSprite(spritename,cell.x,cell.y);
				Actuate.tween(s,0.05,{angle:-5});
				Actuate.tween(s,0.10,{angle:5},false).delay(0.05);
				Actuate.tween(s,0.05,{angle:0},false).delay(0.15);
				
				s.scale=scale;
				p.sprite=s;
			}

		}
	}

	function beschraenkPosition(mc:IntPair,inv:Inventar):Dynamic{
		var iw = CONST.invW;
		var ih = CONST.invH;

		var result:IntPair = {
			x:mc.x,
			y:mc.y
		};

		//step 

		var r_dyn = inv.schlange[zustand.ausgewaehltesabteil];
		var r = r_dyn.ruestung;
		var r_rot = r_dyn.rotation;

		var r_w = r.w[r_rot];
		var r_h = r.h[r_rot];

		//first center box on mouse coords
		result.x=Math.round(result.x-r_w/2+0.5);
		result.y=Math.round(result.y-r_h/2+0.5);

		if (result.x<0){
			result.x=0;
		}
		if (result.y<0){
			result.y=0;
		}
		if (result.x+r_w>iw){
			result.x = iw-r_w;
		}
		if (result.y+r_h>ih){
			result.y = ih-r_h;
		}

		return result;

	}

	function pointCollidesPlacement(i:Int,j:Int,p:Placement):Bool{
		var rot = p.ruestung.rotation;
		var r = p.ruestung.ruestung;
		var f = r.form[rot];
		var px = p.x;
		var py = p.y;

		var rw = r.w[rot];
		var rh = r.h[rot];

		var tx = -px+i;
		var ty = -py+j;

		if (tx<0 || tx>=rw || ty<0 || ty>=rh){
			return false;
		}
		
		return f[tx][ty]==1;
	}

	function platzFrei(i:Int,j:Int,dyn:KlasseDynamisch,inv:Inventar):Bool {
		if (i<0 || j<0 || i>=CONST.invW || j>=CONST.invH){
			return false;
		}
		if (dyn.platz[i][j]==false){
			return false;
		}		
		var r_dyn = inv.schlange[zustand.ausgewaehltesabteil];
		var ruestung = r_dyn.ruestung;
		var rot = r_dyn.rotation;
		var r_w = ruestung.w[rot];
		var r_h = ruestung.h[rot];
		
		for (r_index in 0...inv.placed.length){
			var r = inv.placed[r_index];	
			if (pointCollidesPlacement(i,j,r)){
				return false;
			}					
		}
		return true;
	}
	
	function zeichnMarkierung(mc:Dynamic,x:Float,y:Float,w:Float,h:Float):Bool {
		if (zustand.zug!=0 || zustand.ausgewaehltesabteil==-1){
			return false;			
		}

		
		//first, item should be centered on cursor if possible

		var ruestungDyn = zustand.inv1.schlange[zustand.ausgewaehltesabteil];
		var ruestung = ruestungDyn.ruestung;
		var rot = ruestungDyn.rotation;

		var cell = getGridCoord(mc.x,mc.y,x,y,w,h);

		//draw alphaed item
		Gfx.imagealpha=0.6;
		var name = ruestung.bild[ruestungDyn.rotation];
		var width = Gfx.imagewidth(name);
		var height = Gfx.imageheight(name);
		var scale = ruestung.w[rot]*cell.size/width;
		Gfx.scale(scale);
		Gfx.rotation(cursorrot,width/2,height/2);
		Gfx.drawimage(cell.x,cell.y,ruestung.bild[ruestungDyn.rotation]);
		Gfx.rotation(0);
		Gfx.scale(1);
		Gfx.imagealpha=1.0;

		var result=true;
		Gfx.linethickness = GUI.slimlinethickness;
		for (i in 0...ruestung.w[rot]){
			for (j in 0...ruestung.h[rot]){
				if (ruestung.form[rot][i][j]==1){
					var cx = cell.x+cell.size/2+i*cell.size;
					var cy = cell.y+cell.size/2+j*cell.size;
					if (zustand.dyn1.platz[mc.x+i][mc.y+j] && platzFrei(mc.x+i,mc.y+j,zustand.dyn1,zustand.inv1)){
						//Gfx.drawcircle(cx,cy,cell.size/3,PAL.giltFarb);
					} else {
						Gfx.linethickness = GUI.linethickness;
						var d = cell.size/4;
						Gfx.drawline(cx-d,cy-d,cx+d,cy+d,PAL.schlechtFarb);
						Gfx.drawline(cx+d,cy-d,cx-d,cy+d,PAL.schlechtFarb);
						//Gfx.drawcircle(cx,cy,cell.size/3,PAL.schlechtFarb);
						Gfx.linethickness = GUI.slimlinethickness;					
						result=false;
					}
				}
			}
		}
		Gfx.linethickness = GUI.linethickness;

		return result;
	}

	function canPlace(r:Ruestung,i:Int,j:Int,rot:Int,inv:Inventar):Bool{
		return true;
	}
	
	function bloodAt(x:Float,y:Float){
		Particle.GenerateParticles(
			{
				min:x-10,
				max:x+10,
			},
			{
				min:y-10,
				max:y+10,
			},
			"part",
			10,
			0,
			300,
			{
				min:1,
				max:1
			},
			{
				min:0,
				max:360
			},
			{
				min:-100, max:100
			},
			{
				min:50, max:150
			},
			{
				min:500,
				max:720
			},
			{
				min:1,max:1
			},
			{
				min:0,max:0
			}
		);			

	}

	function haufenUebergangAnimation(
		haufen_x:Float,
		haufen_y:Float,
		haufen_w:Float,
		haufen_h:Float,
		haufen:Array<HaufenPlacement>,
		zuHaufen:Array<HaufenPlacement>){
		if (zuHaufen.length==0){
			return;
		}

		var border=10;
		haufen_x+=border;
		haufen_y+=border;
		haufen_w-=2*border;
		haufen_h-=2*border;

		var zelle_w=haufen_w;
		var zelle_h=haufen_h/haufen.length;

		for (i in 0...haufen.length){
			var hp = haufen[i];
			var bild = hp.dyn.ruestung.bild[hp.dyn.rotation];
			var iw = Gfx.imagewidth(bild);
			var ih = Gfx.imageheight(bild);

			var r_h = zelle_w/iw;
			var r_w = zelle_h/ih;

			var ts=r_w;
			if (r_h<r_w){
				ts=r_h;
			} 

			var tx = haufen_x + haufen_w/2 - ts*iw/2;
			var ty = haufen_y + i*haufen_h/haufen.length + zelle_h/2 - ts*ih/2;
			
			Actuate.tween(hp.sprite,0.3,{
				x:tx,
				y:ty,
				scale:ts});
				
		}
		//1 determine target scales
		//1 determine new positions

		//2 twee everything
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

			if (zustand.schadenp1>=0){				
				extraschaden1=zustand.schadenp1-zustand.dyn1.gesundheit;
				Actuate.tween(this,0.1,{extraschaden1:0});
				Actuate.tween(this,0.1,{portraitscale1:1.05});
				Actuate.tween(this,0.1,{portraitscale1:1},false).delay(0.1);
			}

			var width = drawDetailsPanel(10,my+10,spielerklasse,spielerklassedynamisch,zustand.schadenp1,portraitscale1,extraschaden1,zustand.wein1);			
			zustand.wein1=false;
			zustand.schadenp1=-1;
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

			var buttonheight=30;				
				
			var haufen_x=sw-10-schlangewidth;
			var haufen_y=my+10;
			var haufen_w=schlangewidth;
			var haufen_h=h-buttonheight;
			zeichnHaufen(haufen_x,my+10,schlangewidth,h-buttonheight, spielerklasse,spielerklassedynamisch,zustand.inv1);

			if (zustand.zuHaufen1.length>0){
				haufenAnimation1=true;
				haufenUebergangAnimation(haufen_x,haufen_y,haufen_w,haufen_h,zustand.inv1.haufen,zustand.zuHaufen1);
				//zustand.inv1.haufen
				//Actuate.
			} 

			var zugfertigAktiviert : Bool = zustand.zug == 0;
			if (IMGUI.kleineSchaltflaeche(
				sw-schlangewidth-10,
				sh-buttonheight-10,
				schlangewidth,
				buttonheight,
				S("Zug fertig","End Turn"),
				!zugfertigAktiviert)){
				zustand.endZug();
			}

			w-=schlangewidth+10;

			var mc = gridCollision(Mouse.x,Mouse.y,x,y,w,h);
			
			var bounds = getBoxBounds(x,y,w,h);

			Gfx.linethickness=GUI.linethickness;
			Gfx.drawbox(bounds[0],bounds[1],bounds[2],bounds[3],PAL.fg);
			x+=GUI.linethickness*2;
			y+=GUI.linethickness*2;
			w-=GUI.linethickness*4;
			h-=GUI.linethickness*4;
		
			zeichnInventar(x,y,w,h,mc,spielerklassedynamisch,zustand.inv1);		

			SpriteManager.render();
			if (mc!=null && zustand.zug==0 && zustand.ausgewaehltesabteil>=0){
				mc = beschraenkPosition(mc,zustand.inv1);
				var cell = getGridCoord(mc.x,mc.y,x,y,w,h);
				//Gfx.linethickness=GUI.linethickness;
				//Gfx.drawbox(cell.x,cell.y,cell.size,cell.size,PAL.buttonBorderCol);
				//Gfx.linethickness=GUI.linethickness;

				if (zeichnMarkierung(mc,x,y,w,h)){
					if (Mouse.leftclick()){
						zustand.placePiece(mc);
					}
				} else {
					if (Mouse.leftclick()){
						Actuate.tween(this,0.01,{cursorrot:-5});
						Actuate.tween(this,0.02,{cursorrot:5},false).delay(0.01);
						Actuate.tween(this,0.01,{cursorrot:0},false).delay(0.03);
					}
				}
			}
		}

		//enemy at top
		{	

			if (zustand.schadenp2>=0){				
				extraschaden2=zustand.schadenp2-zustand.dyn2.gesundheit;
				Actuate.tween(this,0.1,{extraschaden2:0});
				Actuate.tween(this,0.1,{portraitscale2:1.05});
				Actuate.tween(this,0.1,{portraitscale2:1},false).delay(0.1);
			}
			var width = drawDetailsPanel(Math.floor(sw-10-infopanelwidth),10,gegnerklasse,gegnerklassedynamisch,zustand.schadenp2,portraitscale2,extraschaden2,zustand.wein2);
			zustand.wein2=false;
			zustand.schadenp2=-1;

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
