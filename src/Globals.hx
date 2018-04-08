typedef SpielState = {
    var sprache : Int;
    var auserwaehlte : Int;
    var ort : Int;
    var owd : OberweltData;
    var tx : Int;
    var ty : Int;
    var dyn : KlasseDynamisch;
};

class Globals
{

  public static function kollidieren(p1:Placement,p2:Placement):Bool {
      return true;
  }

  public static var PAL = {
      fg : Col.WHITE,   
      bg : Col.BLACK,
      
      fgDisabled : Col.GRAY,

      bghighlight : 0x999999,

      buttonTextCol : Col.WHITE,
      buttonBorderCol : Col.WHITE,
      buttonCol : Col.BLACK,
      buttonHighlightCol : 0x444444,
      buttonHighlightCol2 : 0xcccccc,
      titelFarbe: Col.RED,

      giltFarb: Col.GREEN,
      schlechtFarb: Col.RED,
  };

  public static var CONST = {
      invW : 6,    
      invH : 5,
      schlangelaenge : 4,
  };

  public static var GUI = {
      smalltextsize:20,
      textsize:30,
      buttonTextSize:70,
      buttonPaddingX : 40,
      buttonPaddingY : 5,
      linethickness : 5,
      slimlinethickness : 2,
      thicklinethickness : 10,
      titleTextSize:207,
      subTitleTextSize:107,
      vpadding:10,
      healthbarheight:20,
    subSubTitleTextSize:60,

    portraitsize:80,
      
      screenPaddingTop:30,
      
      font:"GermaniaOne-Regular",
  };

  public static var state : SpielState = {
      sprache:0,
      auserwaehlte:0,
      ort:0,
      owd:null,
      tx:-1,
      ty:-1,
      dyn:null
  };

  public static function S(de:String,en:String):String{
      if (state.sprache==0){
          return de;
      } else {
        return en;
      }
  }

    public static var Kreaturen:Array<Kreatur>;
    public static var KreaturenDictionary:Map<String,Kreatur>;

    public static var KreaturenSpielbar:Array<String>;

    public static var Orte:Array<Ort>;
    public static var OrteDictionary:Map<String,Ort>;

    public static var Ruestungen:Array<Ruestung>;
    public static var RuestungenDictionary:Map<String,Ruestung>;

    public static function LoadDat(){
        Kreaturen = new Array<Kreatur>();
        KreaturenDictionary = new Map<String,Kreatur>();
        KreaturenSpielbar = new Array<String>();

        {
            var dat:Array<Array<String>> = Data.load2dcsv("kreaturen",";");

            var kreaturenueberschriften:Array<String> = new Array<String>();
            
            for (i in 0...dat.length){
                var e = dat[i][0];
                kreaturenueberschriften.push(e);
            }

            var name_index = kreaturenueberschriften.indexOf("Name");
            var ort_index = kreaturenueberschriften.indexOf("Ort");
            var beschreibung_de_index = kreaturenueberschriften.indexOf("Beschreibung_DE");
            var beschreibung_en_index = kreaturenueberschriften.indexOf("Beschreibung_EN");
            var spielbar_index = kreaturenueberschriften.indexOf("spielbar");
            var stufe_index = kreaturenueberschriften.indexOf("Stufe");
            var lagerplatz_index = kreaturenueberschriften.indexOf("Lagerplatz");
            var gesundheitplatz_index = kreaturenueberschriften.indexOf("Gesundheit");
            var sichtbareslot_index = kreaturenueberschriften.indexOf("Sichtbareslot");
            var ruestung1_index = kreaturenueberschriften.indexOf("Rüstung1");
            var ruestung2_index = kreaturenueberschriften.indexOf("Rüstung2");
            var ruestung3_index = kreaturenueberschriften.indexOf("Rüstung3");
            var ruestung4_index = kreaturenueberschriften.indexOf("Rüstung4");
            var ruestung5_index = kreaturenueberschriften.indexOf("Rüstung5");
            var ruestung6_index = kreaturenueberschriften.indexOf("Rüstung6");
            
            for (i in 1...dat[0].length){
                var e = dat[name_index][i];
                var ort = dat[ort_index][i];
                var spielbar = dat[spielbar_index][i]=="WAHR";
                var lagerplatz:String = dat[lagerplatz_index][i];
                var stufe:Int = Std.parseInt(dat[stufe_index][i]);            
                var en = e.charAt(0).toUpperCase()+e.substring(1);
                var beschreibung = new StringPair(dat[beschreibung_de_index][i],dat[beschreibung_en_index][i]);
                var gesundheit:Int = Std.parseInt(dat[gesundheitplatz_index][i]);            
                var sichtbareslot:Int = Std.parseInt(dat[sichtbareslot_index][i]);            
                var ruestung:Array<String> = new Array<String>();

                var s:String;
                
                s=dat[ruestung1_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                s=dat[ruestung2_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                s=dat[ruestung3_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                s=dat[ruestung4_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                s=dat[ruestung5_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                s=dat[ruestung6_index][i];
                if (s!=""){
                    ruestung.push(s);
                }
                
                var c:Kreatur = new Kreatur(
                e,
                ort,
                new StringPair(en,en),
                "sprites/"+e,
                spielbar,
                stufe,
                lagerplatz,
                beschreibung,
                gesundheit,
                sichtbareslot,
                ruestung);

                Kreaturen.push(c);
                KreaturenDictionary.set(e,c);
                if (spielbar){
                    KreaturenSpielbar.push(e);
                }
            }
        }



        Orte = new Array<Ort>();
        OrteDictionary = new Map<String,Ort>();

        {
            var dat:Array<Array<String>> = Data.load2dcsv("orte",";");

            var orteueberschriften:Array<String> = new Array<String>();

            for (i in 0...dat.length){
                var e = dat[i][0];
                orteueberschriften.push(e);
            }

            var name_index = orteueberschriften.indexOf("Name");
            var druckname_de_index = orteueberschriften.indexOf("Druckname_DE");
            var druckname_en_index = orteueberschriften.indexOf("Druckname_EN");
            var beschreibung_de_index = orteueberschriften.indexOf("Beschreibung_DE");
            var beschreibung_en_index = orteueberschriften.indexOf("Beschreibung_EN");

            for (i in 1...dat[0].length){
                var e = dat[name_index][i];
                var e_druckname = new StringPair(dat[druckname_de_index][i],dat[druckname_en_index][i]);
                var e_beschreibung = new StringPair(dat[beschreibung_de_index][i],dat[beschreibung_en_index][i]);

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


        Ruestungen = new Array<Ruestung>();
        RuestungenDictionary = new Map<String,Ruestung>();
        {
            var dat:Array<Array<String>> = Data.load2dcsv("ruestung",";");

            var ruestungenueberschriften:Array<String> = new Array<String>();

            for (i in 0...dat.length){
                var e = dat[i][0];
                ruestungenueberschriften.push(e);
            }

    

            var name_index = ruestungenueberschriften.indexOf("Name");
            var druckname_de_index = ruestungenueberschriften.indexOf("Druckname_DE");
            var druckname_en_index = ruestungenueberschriften.indexOf("Druckname_EN");
            var beschreibung_de_index = ruestungenueberschriften.indexOf("Beschreibung_DE");
            var beschreibung_en_index = ruestungenueberschriften.indexOf("Beschreibung_EN");
            var form_index = ruestungenueberschriften.indexOf("Form");
            var onplay_index = ruestungenueberschriften.indexOf("scripts");
            var bleibend_index = ruestungenueberschriften.indexOf("bleibend");

            for (i in 1...dat[0].length){
                var e = dat[name_index][i];
                var e_druckname = new StringPair(dat[druckname_de_index][i],dat[druckname_en_index][i]);
                var e_beschreibung = new StringPair(dat[beschreibung_de_index][i],dat[beschreibung_en_index][i]);

                // var e_formstr = dat[form_index][i];
                var e_onplaystr = dat[onplay_index][i];
                var e_bleibend = dat[bleibend_index][i];
                var e_form = dat[form_index][i];
                var c:Ruestung = new Ruestung(
                    e,
                    "ruestung/"+e,
                    e_druckname,
                    e_beschreibung,
                    e_form,
                    e_onplaystr,
                    e_bleibend=="WAHR"
                    
                    );

                Ruestungen.push(c);
                RuestungenDictionary.set(e,c);
            }
        }
    }
}