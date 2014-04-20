class Credits{

	Credits(){
		addCreditToList();
	}

	void addCreditToList(){
		button = new Button(screen);
        button.fillButtonList("credit", "Save", "mainMenu", (screen.getWidthScreen() / 2) - 100, 500, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
	}

	void render(){
		makeText("Arial", 20, color(255,255,255), "Creators", 10, 20);
		makeText("Arial", 16, color(255,255,255), " - Putman Alisio", 10, 70);
		makeText("Arial", 16, color(255,255,255), " - Butseraen Jim", 10, 100);
	}

	void makeText(String font, int size, color col, String tekst, int xTekst, int yTekst){
		PFont f = createFont(font,size,false);
      	textFont(f,size);
      	fill(col);
      	textAlign(LEFT);
      	text(tekst, xTekst, yTekst);
	}
}