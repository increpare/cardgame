package klasse;

class RuestungDynamisch
{
    public var ruestung:Ruestung;
    public var rotation:Int;
    public var schildnummer:Int=-1;
    
    public function new(ruestung:Ruestung, rotation:Int)
    {
        this.ruestung=ruestung;
        this.rotation=rotation;
    }
}
