package faehigkeit;

class Schad extends Faehigkeit {
    public var schadenmenge:Int;

    public function new(spieler:Int,dyn:RuestungDynamisch,zustand:KampfZustand,schadenmenge:Int){
        super(spieler,dyn,zustand);
        this.schadenmenge =schadenmenge;
    }    

    public override function selbstplatzierung(p:Placement){
        zustand.schaeden(1-spieler,schadenmenge);
    }
}