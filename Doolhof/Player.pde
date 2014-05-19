class Player {

  //classes
  Sprite sprite;
  Level level;
  PImage playerSprite;
  Keyboard keyboard;
  ReadWriteFile file;
  MiniGame miniGame;
  Screen screen;
  Tekst tekst;
  Data data;
  Piano piano;
  Hue hue;
  Timer timer;
  Button button;

  //fields
  String location;
  boolean reachedGoal = false;
  String dataPath = "data/";
  int xPlayer = 0;
  int yPlayer = 0;
  int speed = 1;
  int anim = 0;
  int time = 0;;
  String playerSpriteTile = "up0";
  int widthScreen = 0;
  int heightScreen = 0;
  boolean falseMessage = false;
  boolean gewonnen = false;
  
  //constructoren
  //deze constructor renderd de map en layer op specefieke locatie
  Player(String path, int xPlayer, int yPlayer, String levelPath, String location, int widthScreen, int heightScreen, Screen screen, Sprite sprite){
    this.level = new Level(levelPath, widthScreen, heightScreen, screen, true);
    this.screen = screen;
    this.file = screen.getReadWriteFile();
    this.widthScreen = widthScreen;
    this.heightScreen = heightScreen;
    this.xPlayer = xPlayer;
    this.yPlayer = yPlayer;
    this.keyboard = screen.getKeyboard();
    this.location = location;
    this.sprite = sprite;
    this.miniGame = screen.getMiniGame();
    this.piano = screen.getPiano();
    this.hue = screen.getHue();
    this.data = screen.getData();
    this.tekst = new Tekst();
    this.playerSprite = sprite.getSpriteSheet(path);
    playerSprite.resize(playerSprite.width / 2, playerSprite.height / 2);
    //button = screen.getButton();
  }

  //deze constructor renderd de map en layer op locatie sprite
  Player(String path, String levelPath, String location, int widthScreen, int heightScreen, Screen screen, Sprite sprite){
    this.level = new Level(levelPath, widthScreen, heightScreen, screen, true);
    this.screen = screen;
    this.file = screen.getReadWriteFile();
    this.widthScreen = widthScreen;
    this.heightScreen = heightScreen;
    level.getSpawnGoal();
    this.xPlayer = level.spawnX;
    this.yPlayer = level.spawnY;
    this.keyboard = screen.getKeyboard();
    this.location = location;
    this.sprite = sprite;
    this.miniGame = screen.getMiniGame();
    this.piano = screen.getPiano();
    this.hue = screen.getHue();
    this.data = screen.getData();
    this.tekst = new Tekst();
    this.playerSprite = sprite.getSpriteSheet(path);
    playerSprite.resize(playerSprite.width / 2, playerSprite.height / 2);
    //button = screen.getButton();
  }

  //methods
  void newLevel(String levelPath, int widthScreen, int heightScreen, String location){
    this.level = new Level(levelPath, widthScreen, heightScreen, screen, true);
    level.getSpawnGoal();
    this.widthScreen = widthScreen;
    this.heightScreen = heightScreen;

    reset();

    if(level.spawnX != 0 || level.spawnY != 0){
      this.xPlayer = level.spawnX;
      this.yPlayer = level.spawnY;
    }else{
      this.xPlayer = 6;
      this.yPlayer = 5;
    }
    this.location = location;
  }

  void reset(){
    hue.visible = false;
    piano.visible = false;
    miniGame.index = 0;
    gewonnen = false;
  }

  void winScreen(){
    fill(color(96,96,96));
    rect(((screen.getWidthScreen() * screen.getScale()) / 2) - 200, ((screen.getHeightScreen() * screen.getScale()) / 2) - 150, 400, 200);
    button = new Button(screen);
    button.fillButtonList("gewonnen", "Hoofd menu", "mainMenu", ((screen.getWidthScreen() * screen.getScale()) / 2) - 50, ((screen.getHeightScreen() * screen.getScale()) / 2), 100, 40, color(0,0,80), color(255,255,255), 16, 8, 25, "Arial", true, false);
    button.render("gewonnen");
    fill(color(255,255,255));
    PFont f = createFont("Arial",30,true);
    textFont(f,30);
    text("Gewonnen!",((screen.getWidthScreen() * screen.getScale()) / 2) - 75, ((screen.getHeightScreen() * screen.getScale()) / 2) - 50);
  }

  void render(int xLoc, int yLoc, int widthScreen, int heightScreen){
    actions(xLoc, yLoc, widthScreen, heightScreen);

    int xx = widthScreen / 2;
    int yy = heightScreen / 2;
    level.render(xx - xLoc,yy - yLoc,0,0, widthScreen, heightScreen);

    if(!piano.visible && !hue.visible && !gewonnen){
      renderPlayer(xx,yy);
      move();
    }
    interact();
    tekst.render("Arial", color(255,255,255), timer);

    if(piano.huidigeGeluid == piano.maxAantalGeluiden && !tekst.showTekst && !piano.start && !piano.falseMessage){
      piano.start = true;
      newTimer("Jouw Beurt!", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 80, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 200, 50, true);
    }

    if(piano.succes && !piano.correct) {
      piano.correct = true;
      newTimer("Correct.", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 80, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 200, 50, true);
    }

    if(piano.falseMessage) {
      piano.falseMessage = false;
      newTimer("Probeer Opnieuw.", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 130, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 300, 50, true);
    }

    if(hue.index == hue.aatalColors && !tekst.showTekst && !hue.start && !hue.falseMessage){
      hue.start = true;
      newTimer("Jouw Beurt!", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 80, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 200, 50, true);
    }

    if(hue.succes && !hue.correct) {
      hue.correct = true;
      newTimer("Correct.", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 80, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 200, 50, true);
    }

    if(hue.falseMessage) {
      hue.falseMessage = false;
      newTimer("Probeer Opnieuw.", 3, ((screen.getWidthScreen() * screen.getScale()) / 2) - 130, ((screen.getHeightScreen() * screen.getScale()) / 2) - 110, 30, 300, 50, true);
    }
    if(gewonnen) winScreen();
  } 

  void renderPlayer(int x, int y){
    image(sprite.getSprite(playerSpriteTile, sprite.getPixelSize(),sprite.getPixelSize(), playerSprite), (x * sprite.getTileMultiplier()) << sprite.getTileSize(), (y * sprite.getTileMultiplier()) << sprite.getTileSize(), sprite.getPixelSize()*sprite.getTileMultiplier(), sprite.getPixelSize()*sprite.getTileMultiplier());
  }

  void getPlayerSprite(String name){
    playerSpriteTile = name + anim;
    if(time % 8 == 0){
     time = 0;
     if(anim + 1 == 3) anim = 0;
     anim++;
   }
   time++;
 }

 //deze methode verplaats de map en steld de juiste sprite voor player in
 void move(){
  if(keyboard.left){
    getPlayerSprite("left");
    if(!level.collisionNextTile((int)xPlayer-(int)speed, (int)yPlayer)) xPlayer -= speed;
  }
  if(keyboard.right){
    getPlayerSprite("right");
    if(!level.collisionNextTile((int)xPlayer+(int)speed, (int)yPlayer)) xPlayer += speed;
  }
  if(keyboard.up){
    getPlayerSprite("up");
    if(!level.collisionNextTile((int)xPlayer, (int)yPlayer-(int)speed)) yPlayer -= speed;
  }
  if(keyboard.down){
    getPlayerSprite("down");
    if(!level.collisionNextTile((int)xPlayer, (int)yPlayer+(int)speed)) yPlayer += speed;
  }
  reachedGoal();
}

void reachedGoal(){
  if((xPlayer == level.goalX) && (yPlayer == level.goalY) && (!reachedGoal)){
    reachedGoal = true;
    nextLevel();
  }
}

void nextLevel(){
  int index = int(str(location.charAt(5))) + 1;
  String levelPath = "level" + index;
  boolean found = false;
  for(int i = 0; i < file.levelList.size();i++){
    if(file.levelList.get(i).equals(levelPath) && !found){
      location = "level" + index;;
      level = new Level(dataPath + "sheets/" + location + ".png", widthScreen, heightScreen, screen, true);
      level.getSpawnGoal();
      this.xPlayer = level.spawnX;
      this.yPlayer = level.spawnY;
      reachedGoal = false;
      found = true;
      screen.lastUnlockedLevel = location;
      reset();
    }
  }
  if(!found) {
    gewonnen = true;
  }
}

void interact(){
  if(keyboard.space && !keyboard.input && !piano.visible){
    keyboard.input = true;
    if(level.checkNextTile(xPlayer - 1, yPlayer,0,0,0)) level.getMiniGame(xPlayer - 1, yPlayer);
    if(level.checkNextTile(xPlayer + 1, yPlayer,0,0,0)) level.getMiniGame(xPlayer + 1, yPlayer);
    if(level.checkNextTile(xPlayer, yPlayer - 1,0,0,0)) level.getMiniGame(xPlayer, yPlayer - 1);
    if(level.checkNextTile(xPlayer, yPlayer + 1,0,0,0)) level.getMiniGame(xPlayer, yPlayer + 1);
  }
}

//deze methode overloopt alle acties een player kan doen
void actions(int xLoc, int yLoc, int widthScreen, int heightScreen){
  //save game
  if(keyboard.save && !keyboard.input){
    keyboard.input = true;
    file.dataList = new ArrayList();
    file.dataList.add(data.fillDataList("widthLevel", screen.getWidthScreen()));
    file.dataList.add(data.fillDataList("heightLevel", screen.getHeightScreen()));
    file.dataList.add(data.fillDataList("scale", screen.getScale()));
    file.dataList.add(data.fillDataList("tileMultiplier", sprite.tileMultiplier));
    file.dataList.add(data.fillDataList("playerLocation", screen.player.location));
    file.writeToFile(saveFilePath);
    newTimer("Gegevens Opgeslagen", 3, 10, 60, 20, 0, 0, false);
  }
  //maakt een printscreen
  if(keyboard.saveImage && !keyboard.input){
    keyboard.input = true;
    level.saveImage(xLoc, yLoc, widthScreen, heightScreen);
    newTimer("Screenshot Opgeslagen", 3, 10, 60, 20, 0, 0, false);
  }
  // naar hoofdmenu
  if(keyboard.m && !keyboard.input){
    keyboard.input = true;
    location = "mainMenu";
  }
}

//deze methode maakt een nieuwe timer aan om tekst te renderen
void newTimer(String message, int length, int xTekst, int yTekst, int fontSize, int widthTekst, int heightTekst, boolean background){
  tekst.showTekst = true;
  tekst.message = message;
  tekst.xTekst = xTekst;
  tekst.yTekst = yTekst;
  tekst.fontSize = fontSize;
  tekst.widthTekst = widthTekst;
  tekst.heightTekst = heightTekst;
  tekst.background = background;
  timer = new Timer(length);
}
}

