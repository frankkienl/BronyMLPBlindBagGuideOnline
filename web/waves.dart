import 'dart:html';
import 'classes.dart';

List<AbstractWave> waves;

void main() {  
     initWaves();
     initUI();
}

void initWaves(){
  waves = new List<AbstractWave>();
  waves.add(new Wave1());
  waves.add(new Wave2());
  waves.add(new Wave3());
  waves.add(new Wave4());
  waves.add(new Wave5());
  waves.add(new Wave6());
  waves.add(new Wave7());
  waves.add(new Wave8());
  waves.add(new Wave8_1());
  waves.add(new Wave8_2());
}

void initUI(){
  Element the_content = querySelector("#the_content");
  for (int i=0; i<waves.length; i++){
    the_content.children.add(getRow(waves[i]));
  }
}

Element getRowOLD(AbstractWave wave){
  Element row = new Element.div();
  row.classes.add("row");
  Element image = new Element.img();
  row.children.add(image);
  image.attributes['src'] = "assets/" + wave.getWaveCover();
  image.attributes['height'] = "150";
  Element title = new Element.span();
  title.innerHtml=wave.getWaveName();
  row.children.add(title);
  return row;
}

Element getRow(AbstractWave wave){
  Element row = new Element.div();
  row.classes.add("rowWave");  
  Element image = new Element.img();
  row.children.add(image);
  image.attributes['src'] = "assets/" + wave.getWaveCover();
  image.attributes['height'] = "150";
  Element title = new Element.div();
  title.innerHtml="<a href=\"wave.html?wave="+ wave.getWaveName()+ "\">Wave " + wave.getWaveName() + "</a>";
  title.classes.add("rowWaveTitle");
  row.children.add(title);
  return row;
}