class Main {

	function init(){
		Gfx.createimage("sshot",Gfx.screenwidth,Gfx.screenheight);
		SpriteManager.enable();
		Traenen.enable();
		Particle.enable();


		Globals.LoadDat();
	
		CompileTime.importPackage("faehigkeit");


		//Truetype fonts look a LOT better when we don't scale the canvas!
		Text.font = GUI.font;

		//initial all globals here

		state.sprache = Save.loadvalue("language");
		if (state.sprache==0){
			state.sprache=0;//ok does't do much			
		}

		
	}	

	function update() {	
		// Draw a white background
		Gfx.clearscreen(PAL.bg);
		var h = Gfx.screenheight;
		var w = Gfx.screenwidth;
		Text.wordwrap=w;

		Text.size=GUI.titleTextSize;
		Text.display(Text.CENTER,h/5,S("Ruestung","Ruestung"), PAL.titelFarbe);

		if (IMGUI.button( Text.CENTER,Math.round(h/2+80),S("Zu einer Reise aufbrechen","Set off on an Adventure"))){
			Scene.change(szene.CharakterAuswahl);
		}

		if (IMGUI.schalter( Text.CENTER,Math.round(h/2+GUI.buttonTextSize*2.0+80),
		S("Deutsch","German"),
		S("Englisch","English"),
		1-state.sprache)){
			state.sprache=1-state.sprache;
			Save.savevalue("language",state.sprache);
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
