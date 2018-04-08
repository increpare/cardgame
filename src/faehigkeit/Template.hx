package faehigkeit;

class Template extends Faehigkeit {

    public function new(spieler:Int,dyn:RuestungDynamisch,zustand:KampfZustand,schaedenmenge:Int){
        super(spieler,dyn,zustand);
    }    
    
    private override function vorSelbstSchaedenErleiden(s:Int):Int { return s; };

    private override function vorGegnerSchaedenErleiden(s:Int):Int { return s; };

    public override function selbstplatzierung(p:Placement) {};

    public override function vorRuestungPlatzierung(p:Placement):Bool { return true; };

    public override function nachRuestungPlazierung(p:Placement) {};

    public override function vorRuestungWegwerfen(p:Placement):Bool { return true; };

    public override function nachRuestungWegwerfen() {};

    private override function selbstZugbeginn() {};

    private override function selbstZugend() {};

    private override function gegnerZugbeginn() {};

    private override function gegnerZugend() {};
}