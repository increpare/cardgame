package;

class Global
{
    public static var einstellungen = {
        sprache:0,
    }
    public static function S(e:String,de:String):String 
    { 
        if (einstellungen.sprache==0){
            return e;
        } else {
            return de;
        }
    }
    
}