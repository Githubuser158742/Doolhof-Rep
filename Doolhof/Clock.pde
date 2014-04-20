class Clock{

	//constructoren
	//deze constructor krijgt als param huidige uur, minuut en seconde
	Clock(){

	}

	//methodes
	//deze methode krijgt als param de fonttype, de fontsize, kleur, startpunt x, startpunt y en de tekst
	void render(String font, int size, color col, int xClock, int yClock, String tekst){
    	PFont f = createFont(font,size,false); //fonttype, fontsize, aliasing
      	textFont(f,size);
      	fill(col);
      	text(tekst + ((millis()/(1000*60*60))%24) + ":" + ((millis()/(1000*60))%60) + ":" + ((millis()/1000)%60),xClock,yClock); //0:0:0
  }
}