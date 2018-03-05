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

  public static var GUI = {
      textsize:60,
      buttonTextSize:140,
      buttonPaddingX : 40,
      buttonPaddingY : 5,
      linethickness : 5,
      titleTextSize:415,
      subTitleTextSize:215,

    subSubTitleTextSize:120,
      
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
}