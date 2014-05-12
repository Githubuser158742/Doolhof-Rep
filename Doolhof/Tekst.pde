class Tekst{

	//fields
	boolean showTekst = false;
	int xTekst = 0;
	int yTekst = 0;
	int fontSize = 0;
	int widthTekst = 0;
	int heightTekst = 0;
	String message;
	boolean background = false;

	//constructoren
	Tekst(){

	}

	//methods
	//deze methode update de timer +1 tick
	void render(String font, color col, Timer timer){
		if(showTekst){
			fill(color(0,0,255));
			if(background) rect(xTekst - 20, yTekst - 35, widthTekst, heightTekst);
			print(font, fontSize, col, xTekst, yTekst);
			timer.update();
			if(timer.time == timer.length) showTekst = false;
		}
	}

	//deze methode renderd tekst naar scherm
	void print(String font, int size, color col, int xTekst, int yTekst){
		PFont f = createFont(font,size,true);
		textFont(f,size);
		fill(col);
		text(message,xTekst,yTekst);
	}
}