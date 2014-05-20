class Screen{

	//classes
	AudioPlayer audioPlayer;
	Minim minim;
	Data data;
	Piano piano;
	Level level;
	Player player;
	Keyboard keyboard;
	Audio audio;
	MainMenu mainMenu;
	ReadWriteFile file;
	Sprite sprite;
	MiniGame miniGame;
	Setting setting;
	Credits credits;
	ControlP5 cp5;
	Hue hue;
	Button button;
	GamePlay gamePlay;

	//fields
	int widthScreen = 300;
	int heightScreen = 0;
	int scale = 3;
	int tileWidth = 0;
	int tileHeight = 0;
	String dataPath = "data/";
	String lastUnlockedLevel = "level1";
	String location = "mainMenu";

	//constructoren
	Screen(ReadWriteFile file, Keyboard keyboard, Minim minim, Audio audio, ControlP5 cp5){
		this.data = new Data();
		this.file = file;
		this.keyboard = keyboard;
		this.minim = minim;
		this.audio = audio;
		this.piano = new Piano(this);
		this.hue = new Hue(this);
		this.miniGame = new MiniGame(piano, hue);
		this.sprite = new Sprite(this);
		this.cp5 = cp5;
		button = new Button(this);
		initScreen();
	}

	//methods
	void initScreen(){
		file.readLevelSprites();
		readFile(); 
		if(heightScreen == 0) this.heightScreen = widthScreen / 16 * 9;  
		size(widthScreen * scale, heightScreen * scale);
		background(100);

		initPlayer();

		this.tileWidth = (((widthScreen * scale) >> sprite.getTileSize()) / sprite.getTileMultiplier()) + 1;
		this.tileHeight = (((heightScreen * scale) >> sprite.getTileSize()) / sprite.getTileMultiplier()) + 1;

		initMainMenu();
		this.credits = new Credits(this);
		gamePlay = new GamePlay(this);
		//this.setting = new Setting(this);
	}

	void initPlayer(){
		//if(lastUnlockedLevel.equals("level2")) this.player = new Player(dataPath + "sheets/player.png", 10, 10, dataPath + "sheets/" + lastUnlockedLevel + ".png", location, widthScreen * scale, heightScreen * scale, this, sprite);
		//else this.player = new Player(dataPath + "sheets/player.png", dataPath + "sheets/" + lastUnlockedLevel + ".png", location, widthScreen * scale, heightScreen * scale, this, sprite);
		this.player = new Player(dataPath + "sheets/player.png", dataPath + "sheets/" + lastUnlockedLevel + ".png", location, widthScreen * scale, heightScreen * scale, this, sprite);
	}

	void initMainMenu(){
		this.mainMenu = new MainMenu(widthScreen * scale, heightScreen * scale, widthScreen * scale, heightScreen * scale, dataPath + "sheets/" + file.levelList.get(int(random(0, file.levelList.size()))) + ".png", this);
	}

	//deze methode renderd alles naar scherm
	void render(){
		frameRate(24);
		int m = millis();
		background(100);
		goToLocation();
  	//println(millis() - m);
  }

	//deze methode kijkt welke locatie player is en gaat dan naar die locatie
	void goToLocation(){
		if(player.location.equals("mainMenu")) {
			player.reset();
			mainMenu.render(tileWidth, tileHeight);
			audio.stop("playerGameMusic");
		}
		if(player.location.equals("setting")) setting.render();
		if(player.location.equals("credits")) credits.render();
		if(player.location.equals("gamePlay") || player.location.equals("gamePlay2") || player.location.equals("gamePlay3")) gamePlay.render(player.location);
		//if(player.location.equals("saven")) restart = true;
		if(player.location.equals("new")) player.newLevel(dataPath + "sheets/" + file.levelList.get(0) + ".png", widthScreen * scale, heightScreen * scale, "level1");
		if(player.location.equals("continue")) player.newLevel(dataPath + "sheets/" + lastUnlockedLevel + ".png", widthScreen * scale, heightScreen * scale, lastUnlockedLevel);

		for(int i = 0; i < file.levelList.size();i++){
			if(file.levelList.get(i).equals(player.location)) player.render(player.xPlayer, player.yPlayer, tileWidth, tileHeight);
		}
	}

	//deze methode vult de opgeslagen variabelen op van file
	void readFile(){
		file.readTekstFile();
		for(int i = 0; i < file.dataList.size(); i++){
			String name = file.dataList.get(i).name;
			String value = file.dataList.get(i).value;
			if(name.equals("widthLevel")) widthScreen = int(value);
			if(name.equals("heightLevel")) heightScreen = int(value);
			if(name.equals("scale")) scale = int(value);
			if(name.equals("playerLocation")) lastUnlockedLevel = value;
		}
	}

	//functies
	Player getPlayer(){
		return player;
	}

	Button getButton(){
		return button;
	}

	Setting getSetting(){
		return setting;
	}

	ControlP5 getCP5(){
		return cp5;
	}

	Hue getHue(){
		return hue;
	}

	Data getData(){
		return data;
	}

	String getDataPath(){
		return dataPath;
	}

	Piano getPiano(){
		return piano;
	}

	Level getLevel(){
		return level;
	}

	Keyboard getKeyboard(){
		return keyboard;
	}

	Audio getAudio(){
		return audio;
	}

	MainMenu getMainMenu(){
		return mainMenu;
	}

	ReadWriteFile getReadWriteFile(){
		return file;
	}

	Sprite getSprite(){
		return sprite;
	}

	MiniGame getMiniGame(){
		return miniGame;
	}

	int getWidthScreen(){
		return widthScreen;
	}

	int getHeightScreen(){
		return heightScreen;
	}

	int getScale(){
		return scale;
	}
}