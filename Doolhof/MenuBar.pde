class MenuBar{

	//classes
	Button button;
	Player player;
	Clock clock;
	Screen screen;

	//fields
	int widthMenuBar = 0;
	int heightMenuBar = 0;

	//constructoren
	MenuBar(int widthMenuBar, int heightMenuBar, Screen screen){
		this.screen = screen;
		this.widthMenuBar = widthMenuBar;
		this.heightMenuBar = heightMenuBar;
		this.player = screen.getPlayer();
		this.clock = new Clock();
	}

	//methods
	//deze methode zal alle buttons voor MenuBar toevoegen aan lijst met buttons
	void addMenuBarToList(){
		button = new Button(screen);
		//group, naam, locatie, start locatie x-as, start locatie y-as, breedte button, hoogte button, kleur button, kleur tekst, font size, start locatie tekst x-as, start locatie tekst y-as, font, enable button, center tekst
		button.fillButtonList("menuBar", "Hoofd menu", "mainMenu", 0, 0, 100, 40, color(0,0,80), color(255,255,255), 16, 8, 25, "Arial", true, false);
	}

	/*
	deze methode voegt tekst toe aan de MenuBar
	geeft locatie player op x-as en y-as
	*/
	void addTekstToMenuBar(){
    	PFont f = createFont("Arial",16,true);
    	textFont(f,16);
    	fill(0);
    	text("x: " + player.xPlayer + " y: " + player.yPlayer,110,25);
	}

	//deze methode geeft een background aan MenuBar
	void addBackground(){
		fill(192,192,192);
		rect(0,0,widthMenuBar,40);
	}

	/*
	deze methode zal de volledige MenuBar bij elke frame renderen naar scherm
	background
	tekst: x: ... y: ...
	button naar hoofdmenu
	clock als timer
	*/
	void render(){
		addBackground();
		addTekstToMenuBar();
		button.render("menuBar");
		clock.render("Arial", 16, color(0,0,0), widthMenuBar - 90, 25, "Tijd: ");
	}
}