class Player {
  Sprite sprite;
  Level level;
  PImage playerSprite;
  Keyboard keyboard;
  ReadWriteFile file;
  MiniGame miniGame;
  Screen screen;
  Data data;
  Piano piano;
  Hue hue;
  Timer timer;
  String location;
  boolean reachedGoal = false;
  String dataPath = "data/";
  /*float x = 0;
  float y = 0;
  float speed = 0.1;*/
  int xPlayer = 0;
  int yPlayer = 0;
  int speed = 1;
  int anim = 0;
  int time = 0;;
  String playerSpriteTile = "up0";
  String tekst;
  boolean showTekst = false;
  int widthScreen = 0;
  int heightScreen = 0;
  int xTekst = 0;
  int yTekst = 0;
  int tekstSize = 0;

  /*Player(String path, float x, float y, Keyboard keyboard){
    sprite = new Sprite(path);
    player = sprite.getSprite();
    this.x = x;
    this.y = y;
    this.keyboard = keyboard;
  }*/

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
    this.playerSprite = sprite.getSpriteSheet(path);
    playerSprite.resize(playerSprite.width / 2, playerSprite.height / 2);
  }


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
    this.playerSprite = sprite.getSpriteSheet(path);
    playerSprite.resize(playerSprite.width / 2, playerSprite.height / 2);
  }

  void newLevel(String levelPath, int widthScreen, int heightScreen, String location){
    this.level = new Level(levelPath, widthScreen, heightScreen, screen, true);
    level.getSpawnGoal();
    this.widthScreen = widthScreen;
    this.heightScreen = heightScreen;
    hue.visible = false;
    miniGame.index = 0;

    if(level.spawnX != 0 || level.spawnY != 0){
      this.xPlayer = level.spawnX;
      this.yPlayer = level.spawnY;
    }else{
      this.xPlayer = 6;
      this.yPlayer = 5;
    }
    this.location = location;
  }

  /*void display(float xLoc, float yLoc, float width, float height){
    move();
    interact();
    float xx = width / 2;
    float yy = height / 2;
    level.display(xx - xLoc,yy - yLoc,0,0, width, height); 
    image(sprite.getSprite("water",sprite.getPixelSize(),sprite.getPixelSize()), (xx * sprite.getTileMultiplier()) << sprite.getTileSize(), (yy * sprite.getTileMultiplier()) << sprite.getTileSize(), sprite.getPixelSize()*sprite.getTileMultiplier(), sprite.getPixelSize()*sprite.getTileMultiplier());
  }*/

  void render(int xLoc, int yLoc, int widthScreen, int heightScreen){
    actions(xLoc, yLoc, widthScreen, heightScreen);

    int xx = widthScreen / 2;
    int yy = heightScreen / 2;
    level.render(xx - xLoc,yy - yLoc,0,0, widthScreen, heightScreen);

    if(!piano.visible && !hue.visible){
      renderPlayer(xx,yy);
      move();
    }
    interact();
    renderTekst();
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
  for(int i = 0; i < file.levelList.size();i++){
    if(file.levelList.get(i).equals(levelPath)){
      location = "level" + index;
      level = new Level(dataPath + "sheets/" + location + ".png", widthScreen, heightScreen, screen, true);
      xPlayer = 10;
      yPlayer = 2;
      reachedGoal = false;
    }
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

void actions(int xLoc, int yLoc, int widthScreen, int heightScreen){
  if(keyboard.save && !keyboard.input){
    keyboard.input = true;
    file.dataList = new ArrayList();
    file.dataList.add(data.fillDataList("widthLevel", screen.getWidthScreen()));
    file.dataList.add(data.fillDataList("heightLevel", screen.getHeightScreen()));
    file.dataList.add(data.fillDataList("scale", screen.getScale()));
    file.dataList.add(data.fillDataList("tileMultiplier", sprite.tileMultiplier));
    file.dataList.add(data.fillDataList("playerLocation", screen.player.location));
    file.writeToFile(saveFilePath);
    newTimer("Stats Saved.", 3, 10, 60, 20);
  }
  if(keyboard.saveImage && !keyboard.input){
    keyboard.input = true;
    level.saveImage(xLoc, yLoc, widthScreen, heightScreen);
    newTimer("Image Saved.", 3, 10, 60, 20);
  }
  if(piano.huidigeGeluid == piano.maxAantalGeluiden && !showTekst && !piano.tekstTonen){
    piano.tekstTonen = true;
    if(piano.tekstTonen) newTimer("Your Turn", 3, (screen.getWidthScreen() * screen.getScale()) / 2, (screen.getHeightScreen() * screen.getScale()) / 2, 30);
  }
}

void newTimer(String message, int length, int xLoc, int yLoc, int tSize){
  showTekst = true;
  tekst = message;
  xTekst = xLoc;
  yTekst = yLoc;
  tekstSize = tSize;
  timer = new Timer(length);
}

void renderTekst(){
  if(showTekst){
    printTekst(tekst, "Arial", tekstSize, color(255,255,255), xTekst, yTekst);
    timer.update();
    if(timer.time == timer.length) showTekst = false;
  }
}

void printTekst(String tekst, String font, int size, color col, int xTekst, int yTekst){
  PFont f = createFont(font,size,true);
  textFont(f,size);
  fill(col);
  text(tekst,xTekst,yTekst);
}
}

