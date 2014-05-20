class GamePlay{

	Screen screen;
	Button button;
	Player player;
	PImage pSprite;

	GamePlay(Screen screen) {
		this.screen = screen;
		player = screen.getPlayer();
		pSprite = player.playerSprite;
		addGamePlayToList();
	}

	void addGamePlayToList() {
		button = new Button(screen);
		button.fillButtonList("gamePlay", "Hoofd Menu", "mainMenu", (screen.getWidthScreen() * screen.getScale() / 2) - 100, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
		button.fillButtonList("gamePlay", "Volgende", "gamePlay2", (screen.getWidthScreen() * screen.getScale() / 2) + 150, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);

		button.fillButtonList("gamePlay2", "Hoofd Menu", "mainMenu", (screen.getWidthScreen() * screen.getScale() / 2) - 100, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
		button.fillButtonList("gamePlay2", "Vorige", "gamePlay", (screen.getWidthScreen() * screen.getScale() / 2) - 350, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
		button.fillButtonList("gamePlay2", "Volgende", "gamePlay3", (screen.getWidthScreen() * screen.getScale() / 2) + 150, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);

		button.fillButtonList("gamePlay3", "Hoofd Menu", "mainMenu", (screen.getWidthScreen() * screen.getScale() / 2) - 100, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
		button.fillButtonList("gamePlay3", "Vorige", "gamePlay2", (screen.getWidthScreen() * screen.getScale() / 2) - 350, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
	}

	void render(String loc) {
		if(loc.equals("gamePlay")){
			makeText("Arial", 20, color(255, 255, 255), "Doolhof", (screen.getWidthScreen() * screen.getScale() / 2) - 70, 40);
			makeText("Arial", 20, color(255, 255, 255), "1/3", (screen.getWidthScreen() * screen.getScale() / 2) + 30, 40);
			//makeText("Arial", 16, color(255, 255, 255), " - Putman Alisio", 10, 90);
			PImage left = loadImage("data/sheets/left.png");
			PImage right = loadImage("data/sheets/right.png");
			PImage up = loadImage("data/sheets/up.png");
			PImage down = loadImage("data/sheets/down.png");
			PImage spatie = loadImage("data/sheets/spatie.png");
			spatie.resize(100, 50);
			player.renderPlayer(2,3);
			image(left,10,140);
			image(right,170,140);
			image(up,95,60);
			image(down,95,220);
			image(spatie,300,140);
			makeText("Arial", 16, color(255, 255, 255), "Interactie met hindernissen.", 450, 170);
		}else if(loc.equals("gamePlay2")){
			makeText("Arial", 20, color(255, 255, 255), "Hue", (screen.getWidthScreen() * screen.getScale() / 2) - 70, 40);
			makeText("Arial", 20, color(255, 255, 255), "2/3", (screen.getWidthScreen() * screen.getScale() / 2) + 30, 40);
			makeText("Arial", 16, color(255, 255, 255), "Er worden 3 random kleuren gekozen.", 10, 140);
			makeText("Arial", 16, color(255, 255, 255), "Speel ze na in de juiste volgorde.", 10, 160);
		}else if(loc.equals("gamePlay3")){
			makeText("Arial", 20, color(255, 255, 255), "Piano", (screen.getWidthScreen() * screen.getScale() / 2) - 70, 40);
			makeText("Arial", 20, color(255, 255, 255), "3/3", (screen.getWidthScreen() * screen.getScale() / 2) + 30, 40);
			makeText("Arial", 16, color(255, 255, 255), "Er worden 3 random tonen gekozen.", 10, 140);
			makeText("Arial", 16, color(255, 255, 255), "Speel ze na in de juiste volgorde.", 10, 160);
		}
		button.render(loc);
	}

	void makeText(String font, int size, color col, String tekst, int xTekst, int yTekst) {
		PFont f = createFont(font, size, false);
		textFont(f, size);
		fill(col);
		textAlign(LEFT);
		text(tekst, xTekst, yTekst);
	}
}