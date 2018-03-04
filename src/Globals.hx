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
      buttonHighlightCol : Col.GRAY,
  };

  public static var GUI = {
      textsize:40,
      buttonTextSize:140,
      buttonPaddingX : 40,
      buttonPaddingY : 5,
      linethickness : 5,
      titleTextSize:415,
      font:"GermaniaOne-Regular",
  };

  public static var state = {
      language:0,
  };

  public static function S(de:String,en:String){
      if (state.language==0){
          return de;
      } else {
        return en;
      }
  }
}