/* Classes */
class Pattern {
  String get(int number){
    //Override me
    return "";
  }
}

class AZPattern extends Pattern {
  String alphabet = "ABCDEFGHIKLMNOPRSTUVWXYZ";

  //@Override
  String get(int nr) {
    return "A" + alphabet[nr];
  }
}

class NumberPattern extends Pattern {
  String pattern;
  String appendum;
  
  //no method overloading, that includes constructors.
  //So here is a Named Constructor
  //https://www.dartlang.org/articles/idiomatic-dart/
  NumberPattern.NumberPattern_(String pattern){
    this.pattern = pattern;
    this.appendum = "";
  }
  
  NumberPattern(String pattern, String appendum){
    this.pattern = pattern;
    this.appendum = appendum;
  }
  
  //@Override
  String get(int nr) {
    nr++;
    StringBuffer patternBuilder = new StringBuffer();
    patternBuilder.write(pattern[0]);
    patternBuilder.write((nr >= 20) ? 2 : ((nr >= 10) ? 1 : 0));
    patternBuilder.write(pattern[2]);
    patternBuilder.write((nr % 10));
    patternBuilder.write(pattern[4]);

    if(appendum.length > 0) {
      patternBuilder.write(", ");
      patternBuilder.write(appendum);
    }
    return patternBuilder.toString();
  }
}

class Pony {

    String name;
    String imageName;
    List description;

    Pony(String name, List description, String imageName) {
        this.name = name;
        this.imageName = imageName;
        this.description = description;
    }

    void addDescription(List newDescriptions) {
        //List tempDescriptions =
        //        new String[description.length + newDescriptions.length];
      List tempDescriptions = new List();

        for(int i = 0; i < description.length; i++) {
            tempDescriptions[i] = description[i];
        }

        for(int i = description.length; i < tempDescriptions.length; i++) {
            tempDescriptions[i] = newDescriptions[i - description.length];
        }

        description = tempDescriptions;
    }

    String getNumberInWave() {
        return "#" + description[0];
    }

    String getImageName(){
        return imageName;
    }

    String getName(){
        return name;
    }

    List getDescription(){
        return description;
    }

    //@Override
    String toString() {
        StringBuffer pony = new StringBuffer();

        pony.write("name: ");
        pony.write(name);
        pony.write(", ");
        pony.write("imageName");
        pony.write(imageName);
        pony.write(", ");
        pony.write("position: ");
        pony.write(getNumberInWave());
        pony.write(", ");
        if (description.length >= 2) {
            pony.write("description(s) : ");
            for (int i = 1; i < description.length; i++) {
                pony.write(description[i]);
                pony.write(", ");
            }
        }
        pony.write("\r\n");

        return pony.toString();
    }
}

class AbstractWave {
  int wave;
  String waveName;
  String description;
  List<Pattern> patterns = new List<Pattern>();
  List<Pony> ponies;
  List<String> names;
  List<List<String>> descriptions; //lol double array
  
  void init() {
    ponies = new List<Pony>();
    for (int i = 0; i < names.length; i++) {
      Pony p = new Pony(names[i], descriptions[i], getImageName(this.wave, i));
      //p.addDescription(getPatternString(i));
      ponies.add(p);
    }
  }
  
  List getPatternString(int pony) {
    List patternDescriptions = new List();//new String[patterns.size()];

    for(int i = 0; i < patternDescriptions.length; i++) {
      patternDescriptions[i] = patterns[i].get(pony);
    }

    return patternDescriptions;
  }
  
  String getImageName(int wave, int pony) {
    return getImageName_() +
        ((pony + 1 < 10) ? "0" + (pony + 1).toString() : (pony + 1).toString())
        + "_" + names[pony].replaceAll(" ", "") + ".jpg";
  }
  
  //Dart does not support Method Overloading ! :@ !
  String getImageName_() {
    return "Wave " + wave.toString() + "/";
  }
  
  String getWaveCover() {
    return "Wave " + wave.toString() + "/cover.jpg";
  }
  
  String getDescription() {
    return description;
  }

  int getWave() {
    return wave;
  }

  String getWaveName(){
    return waveName;
  }

  List<Pony> getPonies() {
    return ponies;
  }

  Pony getPony(int position) {
    return ponies[position];
  }
  
  String toString(){
    return "Im to lazy to implement this method. @F";
  }
}

class Wave1 extends AbstractWave {
  Wave1(){
 this.names = [
  "Pinkie Pie", "Applejack", "Rainbow Dash", "Rarity",
  "Twilight Sparkle", "Fluttershy", "Sugar Grape", "Lily Blossom",
  "Lily Blossom Alt", "Minty", "Bumble Sweet", "Fizzy pop",
  "Flower Wishes", "Rose luck", "Sweetie Blue", "Pepper Dance",
  "Lemon Hearts", "Cherry Spices", "Sweetie Swirl", "Lucky Swirl",
  "Sweetcream Scoops", "Firecracker Burst", "Pinkie Pie",
  "Twilight Sparkle", "Twilight Sparkle Alt", "Rainbow Dash"
  ];
 this.descriptions = [
  ["01"], ["02"], ["03"], ["04"], ["05"],
  ["06"], ["07"], ["08"], ["08", "darker variation"],
  ["09"], ["10"], ["11"], ["12"], ["13"], ["14"], ["15"],
  ["16"], ["17"], ["18"], ["19"], ["20"], ["21"],
  ["22", "glittery/transparent"],
  ["23", "glittery/transparent", "pink variation", "Euro Exclusive"],
  ["23", "glittery/transparent", "purple variation"],
  ["24", "glittery/transparent"]                                     
  ];
  
  this.wave = 1;
  this.waveName = "" + this.wave.toString();
  //this.ponies = new List<Pony>();//[names.length];
  
  this.patterns.add(new NumberPattern.NumberPattern_("20405"));
  this.init();
  }
  
  //@Override
  String getImageName(int wave, int pony) {
    int offset = pony >= 8 ? pony >= 24 ? 2 : 1 : 0;

    return getImageName_() + ((pony < (9 + offset)) ? "0" + (pony - offset + 1).toString()
        : (pony - offset + 1).toString()) + "_" + names[pony].replaceAll(" ", "") + ".jpg";
  }
  
  //@Override
  List<String> getPatternString(int pony) {
    List<String> patternDescriptions = new List<String>();//[patterns.size()];

    for (int i = 0; i < patternDescriptions.length; i++) {

      int offset = pony >= 8 ? pony >= 24 ? 2 : 1 : 0;

      patternDescriptions[i] = patterns[i].get(pony - offset);
    }

    return patternDescriptions;
  }
}

class Wave2 extends AbstractWave {
  Wave2(){
    this.names=["Pinkie Pie", "Applejack", "Rainbow Dash", "Rarity",
                "Twilight Sparkle", "Fluttershy", "Feathermay", "Blossomforth",
                "Lulu Luck", "Star Swirl", "Tea Love", "RibbonHeart",
                "Cheerilee", "DaisyDreams", "Stardash", "Honeybelle",
                "Dewdrop Dazzle", "Rainbow Flash", "Pudding Pie", "Snowcatcher",
                "Twinkleshine", "Rarity", "Applejack", "Fluttershy"];
    
    this.descriptions = [["01"], ["02"], ["03"], ["04"], ["05"],
                         ["06"], ["07"], ["08"], ["09"], ["10"],
                         ["11"], ["12"], ["13"], ["14"], ["15"],
                         ["16"], ["17"], ["18"], ["19"], ["20"],
                         ["21"], ["22"], ["23"], ["24"]];
    this.description = "Only released in Europe";
    this.wave = 2;
    this.waveName = "" + this.wave.toString();
    this.ponies = new List<Pony>();//Pony[names.length];

    this.init();
  }
  
}

class Wave3 extends AbstractWave {
  Wave3(){
    this.names=["Twilight Sparkle", "Rarity", "Bitta Luck", "Rainbowshine",
"Goldengrape", "Pinkie Pie", "Rainbow Dash", "Golden Harvest",
"Sprinkle Stripe", "Sea Swirl", "BigMacIntosh", //MacIntosh?
"Twilight Sparkle", "Pinkie Pie",  "Apple Dazzle", "Lovestruck", 
"Berryshine", "Meadow Song", "Rarity", "Applejack",  "Fluttershy", 
"Cherry Berry", "Heartstrings", "Noteworthy", "Lucky Dreams"];

    this.descriptions = [
["01"], ["02"], ["03"], ["04"], ["05"],
["06", "glowy"], ["07"], ["08"], ["09"], ["10"],
["11"], ["12", "glowy"], ["13"], ["14"], ["15"],
["16"], ["17"], ["18", "glowy"], ["19"], ["20"],
["21"], ["22"], ["23"], ["24"]
];
  
    this.wave = 3;
    this.waveName = "" + this.wave.toString();
    this.ponies = new List<Pony>();//Pony[names.length];

    this.patterns.add(new NumberPattern("40502", "US"));
    this.patterns.add(new NumberPattern("40255", "MEX"));
    
    this.init();
  
  }  
  
}


class Wave4 extends AbstractWave {
  Wave4(){
    this.names=["Applejack", "Fluttershy", "Lulamoon", "Crimson Gala", "Minuette",
                "Royal Riff", "Pinkie Pie", "Merry May", "Electric Sky",
                "Chance-A-Lot", "Berry Green", "Rarity", "Twilight Sparkle",
                "Rarity", "Sassaflash", "Peachy Sweet", "Twilight Sky",
                "Applejack", "Rainbow Dash", "Mosely Orange", "Amethyst Star",
                "Twilight Velvet", "Shoeshine", "PinkiePie"];
    this.descriptions = [
                         ["01", "crystal"], ["02", "crystal"], ["03", "crystal"],
                         ["04", "crystal"], ["05", "crystal"], ["06", "crystal"],
                         ["07", "crystal"], ["08", "crystal"], ["09", "crystal"],
                         ["10", "crystal"], ["11", "crystal"], ["12", "metallic"],
                         ["13", "crystal"], ["14", "crystal"], ["15", "crystal"],
                         ["16", "crystal"], ["17", "crystal"], ["18", "metallic"],
                         ["19", "crystal"], ["20", "crystal"], ["21", "crystal"],
                         ["22", "crystal"], ["23", "crystal"], ["24", "metallic"]
                         ];
    this.wave = 4;
    this.waveName = "" + this.wave.toString();
    this.ponies = new List<Pony>();
    this.patterns.add(new NumberPattern("50402","EUR"));
    this.patterns.add(new NumberPattern("80206","US"));
    this.patterns.add(new NumberPattern("80602","CAN"));
    this.init();
  }
  
  //@Override
  String getImageName(int wave, int pony) {
    return super.getImageName_() + ((pony+1 < 10) ? "0" + (pony + 1).toString()
        : (pony + 1).toString()) + "_" + names[pony].replaceAll(" ", "").replaceAll("-", "") + ".jpg";
  }
  
  
}

class Wave5 extends AbstractWave {
  
  Wave5(){
    this.names = ["Twilight Sparkle", "Princess Cadence", "Sunny Rays", "Junebug",
                  "Breezie", "Island Rainbow", "Princess Luna", "Sapphire Shores",
                  "Rainbow Dash", "Flippity Flop", "Gardenia Glow", "Skywishes",
                  "Trixie Lulamoon", "Diamond Rose", "Cinnamon Breeze", "Ploomette",
                  "Golden Delicious", "Ribbon Wishes", "Princess Celestia",
                  "Fluttershy", "Forsythia", "Flitter Heart", "Rainbow Wishes",
                  "Lyra Heartstrings"];
   this.descriptions = [["01"], ["02"], ["03"], ["04"], ["05"],
                        ["06"], ["07"], ["08"], ["09"], ["10"],
                        ["11"], ["12"], ["13"], ["14"], ["15"],
                        ["16"], ["17"], ["18"], ["19"], ["20"],
                        ["21"], ["22"], ["23"], ["24"]]; 
   this.wave = 5;
   this.waveName = "" + this.wave.toString();
   this.ponies = new List<Pony>();
   this.patterns.add(new NumberPattern("70202", ""));
   this.init();
  }
  
}

class Wave6 extends AbstractWave {
  Wave6(){
  this.names = ["Pinkie Pie", "Fluttershy", "Twilight Sparkle", "Rainbow Dash", 
               "Rarity", "Applejack", "Minuette", "Roseluck", "Trixie Lulamoon II",
               "Twilight Velvet", "Mosely Orange", "Berry Green", "Merry May", 
               "Cherry Spices II", "Electric Sky", "Crimson Gala", "Amethyst Star",
               "Twilight Sky", "Sassaflash", "Magnet Bolt", "Royal Riff", 
               "Peachy Sweet", "Chance-A-Lot", "Shoeshine"];
  this.descriptions = [ ["01"], ["02"], ["03", "3D gem symbol"], ["04"], ["05"],
            ["06"], ["07"], ["08"], ["09", "3D gem symbol"], ["10", "3D gem symbol"],
            ["11"], ["12"], ["13"], ["14"], ["15"],
            ["16"], ["17"], ["18"], ["19"], ["20"],
            ["21"], ["22"], ["23"], ["24"]];
  this.wave = 6;
  this.waveName = "" + this.wave.toString();
  this.ponies = new List<Pony>();
  this.patterns.add(new NumberPattern("80206",""));
  this.init();
  }
  
  // @Override
  String getImageName(int wave, int pony) {
    return super.getImageName_() + ((pony+1 < 10) ? "0" + (pony + 1).toString()
        : (pony + 1).toString()) + "_" + names[pony].replaceAll(" ", "").replaceAll("-", "") + ".jpg";
  }
  
}


class Wave7 extends AbstractWave {
  Wave7(){
    this.names=["Pinkie Pie", "Fluttershy", "Twilight Sparkle", "Rainbow Dash",
                "Rarity", "Applejack", "Cherry Pie", "Apple Fritter", 
                "Banana Fluff", "Lilac Links", "Cherry Fizz", "Misty Fly", 
                "Banana Bliss", "Sweetie Drops", "Holly Dash", "Berry Dreams", 
                "Spitfire", "Lucky Clover", "Lily Blossom", "Apple Stars", 
                "Barber Groomsby", "Caramel Apple", "Soarin", "Lily Valley"];
    this.descriptions = [["01"], ["02"], ["03"], ["04"], ["05"],
                         ["06"], ["07"], ["08"], ["09"], ["10"],
                         ["11"], ["12"], ["13"], ["14"], ["15"],
                         ["16"], ["17", "(Misnamed as Soarin on card)"], ["18"], 
                         ["19"], ["20"], ["21"], ["22"], 
                         ["23", "(Misnamed as Spitfire on card)"], ["24"]];
    this.wave = 7;
    this.waveName = this.wave.toString();
    this.ponies = new List<Pony>();
    this.patterns.add(new NumberPattern("90206",""));
    this.init();
  }  
}

class Wave8 extends AbstractWave {
  Wave8(){
  this.names= ["Applejack", "Big MacIntosh", "Royal Riff", "Mosely Orange",
               "Gilda the Griffon", "Flam", "Flim Skim", "Fluttershy", "Skywishes", 
               "Granny Smith", "Princess Cadence", "Golden Harvest",
               "Flower Wishes", "Pinkie Pie", "Sassaflash", "Comet Tail", 
               "Rainbow Dash", "Sunny Rays", "Gardenia Glow", "Lemon Hearts", 
               "Rarity", "Ribbon Wishes", "Lotus Blossom", "Twilight Sparkle"];
  this.descriptions = [["01"], ["02"], ["03"], ["04"], ["05"],
                       ["06"], ["07"], ["08"], ["09"], ["10"],
                       ["11"], ["12"], ["13"], ["14"], ["15"],
                       ["16"], ["17"], ["18"], ["19"], ["20"],
                       ["21"], ["22"], ["23"], ["24"]];
  this.wave = 8;
  this.waveName = this.wave.toString();
  this.ponies = new List<Pony>();
  this.patterns.add(new AZPattern());
  this.init();
  }  
}

class Wave8_1 extends AbstractWave {
  Wave8_1(){
    this.names = ["Rainbow Dash",
                  "Applejack",
                  "Fluttershy",
                  "Flower Wishes",
                  "Skywishes",
                  "Gardenia Glow",
                  "Lemon Hearts",
                  "Big MacIntosh",
                  "Granny Smith",
                  "Comet Tail",
                  "Royal Riff",
                  "Flim Skim"];
    this.descriptions = [ ["01"], ["02"], ["03"], ["04"], ["05"],
                          ["06"], ["07"], ["08"], ["09"], ["10"],
                          ["11"], ["12"]];
    this.wave = 81;
    this.waveName = "8 UK alternative 1";
    this.ponies = new List<Pony>();

    this.patterns.add(new AZPattern());

    this.description = "UK Only?";

    this.init(); 
  }
  
}

class Wave8_2 extends AbstractWave {
  Wave8_2(){
    this.names = ["Sunny Rays",
                  "Princess Cadence",
                  "Mosely Orange",
                  "Pinkie Pie",
                  "Flam",
                  "Sassaflash",
                  "Ribbon Wishes",
                  "Rarity",
                  "Golden Harvest",
                  "Lotus Blossom",
                  "Gilda the Griffon",
                  "Twilight Sparkle"];
    this.descriptions = [ ["01"], ["02"], ["03"], ["04"], ["05"],
                          ["06"], ["07"], ["08"], ["09"], ["10"],
                          ["11"], ["12"]];
    this.wave = 82;
    this.waveName = "8 UK alternative 2";
    this.ponies = new List<Pony>();

    this.patterns.add(new AZPattern());

    this.description = "UK Only?";

    this.init(); 
  }
  
}