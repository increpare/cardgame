package szene;

class Tot {
	

	function init(){
		//Truetype fonts look a LOT better when we don't scale the canvas!

	}	

	function update() {	

		// Draw a white background
		Gfx.clearscreen(PAL.bg);
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;
		Text.wordwrap=w;

		Text.size=GUI.subTitleTextSize;
		Text.display(Text.CENTER,h/5,S("Sie stürben","You died"), PAL.titelFarbe);

		if (IMGUI.button( Text.CENTER,Math.round(h/2+80),S("Schade","What a pity!"))){
			Gfx.grabimagefromscreen("sshot",0,0);
			Scene.change(Main);
		}

		Text.size=1;

		if (Mouse.leftheld()){
			Particle.GenerateParticles(
				{
					min:Mouse.x-10,
					max:Mouse.x+10,
				},
				{
					min:Mouse.y-10,
					max:Mouse.y+10,
				},
				"part",
				1,
				0,
				-10,
				{
					min:1,
					max:1
				},
				{
					min:0,
					max:360
				},
				{
					min:-50, max:50
				},
				{
					min:-100, max:-100
				},
				{
					min:20,
					max:20
				},
				{
					min:1,max:1
				},
				{
					min:0,max:0
				}
			);
		}
		
	}
}
