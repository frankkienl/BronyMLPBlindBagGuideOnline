import 'dart:html';
import 'classes.dart';

void main(){
  
  var waveNumber = 0; 
  Uri myUrl = Uri.parse(window.location.href);
  if (myUrl.queryParameters.containsKey("wave")){
    waveNumber = myUrl.queryParameters['wave'];
  } else {
    //send back to waves
    window.location.href = "waves.html?wave=missing";  
    return;
  }
  
  AbstractWave thisWave = null;
  //switch (waveNumber){
  int theNumber = 0;
  if (waveNumber.endsWith(" 1")){
    theNumber = 81;
  } else if (waveNumber.endsWith(" 2")){
    theNumber = 82;
  } else {
    theNumber = int.parse(waveNumber);
  }
  switch (theNumber){
    case 1: {
      thisWave = new Wave1(); break;
    }
    case 2: {
      thisWave = new Wave2(); break;
    }
    case 3: {
      thisWave = new Wave3(); break;
    }
    case 4: {
      thisWave = new Wave4(); break;
    }
    case 5: {
      thisWave = new Wave5(); break;
    }
    case 6: {
      thisWave = new Wave6(); break;
    }
    case 7: {
      thisWave = new Wave7(); break;
    }
    case 8: {
      thisWave = new Wave8(); break;
    }
    case 81: {
      thisWave = new Wave8_1(); break;
    }
    case 82: {
      thisWave = new Wave8_2(); break;
    }
    default : {
      //send back to waves
      window.location.href = "waves.html?wave=unknown";
      break;
    }
  }
  
  Element the_content = querySelector("#the_content");
  //the_content.innerHtml = "Wave " + waveNumber;
  List<Pony> ponies = thisWave.getPonies();
  for (int i = 0; i < ponies.length; i++){
    Pony pony  = ponies[i];
    int ponyNr = i;
    //
    Element row = new Element.div();
    row.classes.add("rowPony");  
    Element image = new Element.img();
    row.children.add(image);
    image.attributes['src'] = "assets/" + pony.getImageName();
    image.attributes['height'] = "150";
    //
    Element title = new Element.div();
    StringBuffer sb = new StringBuffer();
    for (int j=0; j<pony.getDescription().length; j++){
      sb.write(pony.getDescription()[j]);
      sb.write("<br />\n");
    }
    title.innerHtml=pony.getName() + "<br />" + sb.toString();
    title.classes.add("rowPonyText");
    row.children.add(title);
    //
    the_content.children.add(row);
  }
}