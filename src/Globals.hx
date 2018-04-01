package;
import haxegon.*;

class Globals
{
  public static var PAL = {
      fg : Col.WHITE,   
      bg : Col.BLACK,

      buttonTextCol : Col.WHITE,
      buttonBorderCol : Col.WHITE,
      buttonCol : Col.BLACK,
      buttonHighlightCol : 0x444444,
      buttonHighlightCol2 : 0xcccccc,
      titelFarbe: Col.RED,
  };

  public static var CONST = {
      invW : 6,    
      invH : 3
  };

  public static var GUI = {
      smalltextsize:40,
      textsize:60,
      buttonTextSize:140,
      buttonPaddingX : 40,
      buttonPaddingY : 5,
      linethickness : 5,
      thicklinethickness : 10,
      titleTextSize:415,
      subTitleTextSize:215,
      vpadding:10,
      healthbarheight:20,
    subSubTitleTextSize:120,

    portraitsize:180,
      
      screenPaddingTop:30,
      
      font:"GermaniaOne-Regular",
  };

  public static var state = {
      sprache:0,
      auserwaehlte:0,
      ort:0,
  };

  public static function S(de:String,en:String):String{
      if (state.sprache==0){
          return de;
      } else {
        return en;
      }
  }
 
  public static var Kreaturen:Array<Dynamic>;
    public static function StripQuotes(s:String):String{
          if (e.charAt(0)=="\""){
              return e.substr(1,e.length-2);
          }
          else {
            return e;
          }
    }


  public static function LoadDat(){
      Kreaturen = new Array<Dynamic>();
      var dat:Array<Array<String>> = Data.load2dcsv("kreaturen");
      for (i in 1...dat[0].length){
          var e = StripQuotes(dat[0][i]);
          var spielbar = dat[1][i].toLowerCase()=="y";
          var en = e.charAt(0).toUpperCase()+e.substring(1);
          var c = {
              name:en,
              img:"sprites/"+e,
              spielbar:spielbar
          };
          Kreaturen.push(c);
      }
  }
}