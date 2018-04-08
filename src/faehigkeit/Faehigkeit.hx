package faehigkeit;

@:keepSub
class Faehigkeit {
    public var immortal:Bool=false;
    public var beschaeftigt:Float=0;
    
    public var spieler:Int;
    public var dyn:RuestungDynamisch;
    public var zustand:KampfZustand;

    public function new(spieler:Int,dyn:RuestungDynamisch,zustand:KampfZustand){
        this.spieler=spieler;
        this.dyn=dyn;
        this.zustand=zustand;
    }
    
    public function zugbeginn(_spieler:Int){
        if (spieler==_spieler){
            selbstZugbeginn();
        } else {
            gegnerZugbeginn();
        }
    }

    public function zugend(_spieler:Int){
        if (spieler==_spieler){
            selbstZugend();
        } else {
            gegnerZugend();
        }
    }

    public function vorSchaedenErleiden(_spieler:Int,s:Int):Int {
        if (spieler==_spieler){
            return vorSelbstSchaedenErleiden(s);
        } else {
            return vorGegnerSchaedenErleiden(s);
        }
    }

    private function vorSelbstSchaedenErleiden(s:Int):Int { return s; };

    private function vorGegnerSchaedenErleiden(s:Int):Int { return s; };

    public function selbstplatzierung(p:Placement) {};

    public function vorRuestungPlatzierung(p:Placement):Bool { return true; };

    public function nachRuestungPlazierung(p:Placement) {};

    public function vorRuestungWegwerfen(p:Placement):Bool { return true; };

    public function nachRuestungWegwerfen() {};

    private function selbstZugbeginn() {};

    private function selbstZugend() {};

    private function gegnerZugbeginn() {};

    private function gegnerZugend() {};
}