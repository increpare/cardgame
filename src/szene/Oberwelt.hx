package szene;

import haxegon.*;
import Globals.*;
import ort.*;
import klasse.*;
import fertigkeit.*;
import szene.*;
import utils.*;

class Oberwelt {

	var ort:Ort;
	var spielerklasse:Klasse;

	function init(){
		Text.font = GUI.font;

		var spielerklassetypen = Lambda.array(CompileTime.getAllClasses(Klasse));
		var spielerklassetyp = spielerklassetypen[state.auserwaehlte];
		spielerklasse = Type.createInstance(spielerklassetyp,[]);

		var orttypen = Lambda.array(CompileTime.getAllClasses(Ort));
		var orttyp = orttypen[state.ort];
		ort = Type.createInstance(orttyp,[]);
	}	

	function update() {	
			
	}
}
