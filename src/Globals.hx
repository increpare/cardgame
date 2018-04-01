package;
import haxegon.*;
import utils.*;
import klasse.*;
import ort.*;

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
      invH : 5
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
 
  public static var Kreaturen:Array<Klasse>;

  public static var KreaturenDictionary:Map<String,Klasse>;

  public static var KreaturenSpielbar:Array<String>;


  public static var Orte:Array<Ort>;

  public static var OrteDictionary:Map<String,Ort>;

  public static function SQ(s:String):String{
          if (s.charAt(0)=="\""){
              return s.substr(1,s.length-2);
          }
          else {
            return s;
          }
    }


  public static function LoadDat(){
      Kreaturen = new Array<Klasse>();
      KreaturenDictionary = new Map<String,Klasse>();
      KreaturenSpielbar = new Array<String>();

      var dat:Array<Array<String>> = Data.load2dcsv("kreaturen");
      for (i in 1...dat[0].length){
          var e = SQ(dat[0][i]);
          var spielbar = SQ(dat[1][i].toLowerCase())=="y";
          var en = e.charAt(0).toUpperCase()+e.substring(1);
          var beschreibung = new StringPair(SQ(dat[2][i]),SQ(dat[3][i]));

          var c:Klasse = new Klasse(
              e,
              new StringPair(en,en),
              "sprites/"+e,
              spielbar,
              beschreibung);
          
          Kreaturen.push(c);
          KreaturenDictionary.set(e,c);
          if (spielbar){
              KreaturenSpielbar.push(e);
          }
      }



      Orte = new Array<Ort>();
      OrteDictionary = new Map<String,Ort>();

      var dat:Array<Array<String>> = Data.load2dcsv("orte");
      for (i in 1...dat[0].length){
          var e = SQ(dat[0][i]);
          var en = e.charAt(0).toUpperCase()+e.substring(1);
          var e_druckname = new StringPair(SQ(dat[1][i]),SQ(dat[2][i]));
          var e_beschreibung = new StringPair(SQ(dat[3][i]),SQ(dat[4][i]));

          var c:Ort = new Ort(
              e,
              "bilder/"+e,
              e_druckname,
              e_beschreibung
              );
          
          Orte.push(c);
          OrteDictionary.set(e,c);
      }
  }
}