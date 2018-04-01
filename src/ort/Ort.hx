package ort;

import utils.*;
import fertigkeit.*;

class Ort
{
    public var name:String;
    public var bild:String;
    public var druckname:StringPair;
    public var beschreibung:StringPair;

    public function new(name:String, bild:String,druckname:StringPair,beschreibung:StringPair){
        this.name=name;
        this.bild=bild;
        this.druckname=druckname;
        this.beschreibung=beschreibung;
    }
}