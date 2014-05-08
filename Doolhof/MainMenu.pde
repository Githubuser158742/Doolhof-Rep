class MainMenu{

	//classes
	Keyboard keyboard;
	Button button;
	Level level;
	MiniGame miniGame;
	Piano piano;
	Screen screen;

	//fields
	int widthMainMenu = 0;
	int heightMainMenu = 0;
	int WidthScreen = 0;
	int HeightScreen = 0;
	int xPlayer = 0;
	int yPlayer = 0;

	//constructoren
	//deze constructoe maakt enkel de menu op
	MainMenu(int widthMainMenu, int heightMainMenu, Screen screen){
		this.screen = screen;
		this.widthMainMenu = widthMainMenu;
		this.heightMainMenu = heightMainMenu;
		this.keyboard = screen.getKeyboard();
		this.miniGame = screen.getMiniGame();
		this.piano = screen.getPiano();
		addMainMenuToList();
	}

	//deze constructor maakt de menu op en de achtergrond
	MainMenu(int widthMainMenu, int heightMainMenu, int WidthScreen, int HeightScreen, String levelPath, Screen screen){
		this.screen = screen;
		this.widthMainMenu = widthMainMenu;
		this.heightMainMenu = heightMainMenu;
		this.keyboard = screen.getKeyboard();
		this.miniGame = screen.getMiniGame();
		this.piano = screen.getPiano();
		addMainMenuToList();
		level = new Level(levelPath, WidthScreen, HeightScreen, screen, false);
    	level.getSpawnGoal();
    	this.xPlayer = level.spawnX;
    	this.yPlayer = level.spawnY;
	}

	//methods
	//deze methode zal alle buttons van de MainMenu aan de button lijst toevoegen
	void addMainMenuToList(){
		button = new Button(screen);
        button.fillButtonList("mainMenu", "Nieuw spel", "new", (widthMainMenu / 2) - 100, 50, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
    	button.fillButtonList("mainMenu", "Verder spelen", "continue", (widthMainMenu / 2) - 100, 120, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
    	//button.fillButtonList("mainMenu", "Instellingen", "setting", (widthMainMenu / 2) - 100, 190, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
    	button.fillButtonList("mainMenu", "Gameplay", "", (widthMainMenu / 2) - 100, 190, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", false, true);
    	button.fillButtonList("mainMenu", "Credits", "credits", (widthMainMenu / 2) - 100, 260, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
	}

	/*
deze methode zal de buttons elke frame naar het scherm renderen
rendert de achtergrond naar het scherm
	*/
	void render(int widthScreen, int heightScreen){
		int xx = widthScreen / 2;
    	int yy = heightScreen / 2;
    	level.render(xx,yy,0,0, widthScreen, heightScreen);
		button.render("mainMenu");
	}
}
