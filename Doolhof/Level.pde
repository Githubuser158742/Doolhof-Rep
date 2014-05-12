class Level {
  Sprite sprite;
  MenuBar menuBar;
  Player player;
  Piano piano;
  Minim minim2;
  Audio audio2;
  PImage map;
  Screen screen;
  PImage spriteSheet;
  PImage screenImage;
  MiniGame miniGame;
  Hue hue;
  int spawnX = 0;
  int spawnY = 0;
  int goalX = 0;
  int goalY = 0;
  int xW = 0;
  int yW = 0;

  Level(String path, int widthScreen, int heightScreen, Screen screen, boolean playable){
    this.screen = screen;
    this.sprite = screen.getSprite();
    this.miniGame = screen.getMiniGame();
    this.piano = screen.getPiano();
    this.hue = screen.getHue();
    map = sprite.getSpriteSheet(path);
    spriteSheet = sprite.getSpriteSheet("data/sheets/sheet" + int(random(1,3)) + ".png");
    if(playable) {
      this.player = screen.getPlayer();
      menuBar = new MenuBar(widthScreen, heightScreen, screen);
      menuBar.addMenuBarToList();
    }
  }

  boolean collisionNextTile(int x, int y){
    float r = red(map.pixels[x + y * map.width]);
    float g = green(map.pixels[x + y * map.width]);
    float b = blue(map.pixels[x+ y * map.width]);
    if(r == 160 && g == 160 && b == 160) return true;
    if(r == 0 && g == 0 && b == 0) return true;
    return false;
  }

  boolean checkNextTile(int x, int y, int ri, int gi, int bi){
    float r = red(map.pixels[x + y * map.width]);
    float g = green(map.pixels[x + y * map.width]);
    float b = blue(map.pixels[x+ y * map.width]);
    if(r == ri && g == gi && b == bi) return true;
    return false;
  }

/*colors
  void == water
  0 255 0 == grassL
  0 155 0 == grassD
  117 0 0 == wood
  160 160 160 == wallR
  0 0 0 == wallB
  100 100 100 == end
  100 100 255 == start
  255 100 255 == wallMove
  */

  void getSpawnGoal(){
    if(map != null){
      for (int y = 0; y < map.height; y++) {
        for (int x = 0; x < map.width; x++) { 
          float r = red(map.pixels[(x) + (y) * map.width]);
          float g = green(map.pixels[(x) + (y) * map.width]);
          float b = blue(map.pixels[(x) + (y) * map.width]);
          if(r == 100 && g == 100 && b == 255){
           spawnX = x;
           spawnY = y;
         }
         else if(r == 100 && g == 100 && b == 100){
           goalX = x;
           goalY = y;
         }
       }
     }
   }  
 }

 void renderSprite(String name, int x, int y){
  image(sprite.getSprite(name, sprite.getPixelSize(),sprite.getPixelSize(), spriteSheet), (x * sprite.getTileMultiplier()) << sprite.getTileSize(), (y * sprite.getTileMultiplier()) << sprite.getTileSize(), sprite.getPixelSize()*sprite.getTileMultiplier(), sprite.getPixelSize()*sprite.getTileMultiplier());
}

void saveImage(int xLoc, int yLoc, int widthScreen, int heightScreen){
  int xx = widthScreen / 2;
  int yy = heightScreen / 2;
  render(xx - xLoc,yy - yLoc,0,0, widthScreen, heightScreen);
  player.renderPlayer(xx, yy);
  save(screen.getDataPath() + "images/" + day() + "-" + month() + "-" + year() + "-" + hour() + "-" + minute() + "-" + second() + ".png");
}

void render(int xStart, int yStart, int xRender, int yRender, int width, int height){
  if(map != null){
    int yEnd = yStart + map.height - 1;
    int xEnd = xStart + map.width - 1;
    for (int y = yRender; y < height; y++) {
      for (int x = xRender; x < width; x++) { 
        if((y < yStart || y > yEnd) || (x < xStart || x > xEnd)){
         renderSprite("water", x, y);
         continue;
       }
       float r = red(map.pixels[(x - xStart) + (y - yStart) * map.width]);
       float g = green(map.pixels[(x - xStart) + (y - yStart) * map.width]);
       float b = blue(map.pixels[(x - xStart) + (y - yStart) * map.width]);
       if(r == 0 && g == 255 && b == 0) renderSprite("grassL", x, y);
       else if(r == 0 && g == 155 && b == 0) renderSprite("grassD", x, y);
       else if(r == 117 && g == 0 && b == 0) renderSprite("wood", x, y);
       else if(r == 160 && g == 160 && b == 160) renderSprite("wallR", x, y);
       else if(r == 0 && g == 0 && b == 0) renderSprite("wallB", x, y);
       else if(r == 255 && g == 100 && b == 255) renderSprite("wallMove", x, y);
       else if(r == 100 && g == 100 && b == 255) renderSprite("start", x, y);
       else if(r == 100 && g == 100 && b == 100) renderSprite("end", x, y);
       else renderSprite("water", x, y);
     }
   }
 }
 if(menuBar != null) menuBar.render();
 if(piano.visible){
  piano.render();
  if(piano.succes) wallNewLocation(xW, yW);
} 
if(hue.visible) hue.render();
}

void getMiniGame(int xWall, int yWall){
  xW = xWall;
  yW = yWall;
  String game = miniGame.miniGameList.get(miniGame.index);
  miniGame.incrementIndex();
  if(game.equals("piano")){
    piano.visible = true;
    piano.startTimer();
  } else if(game.equals("hue")){
    hue.visible = true;
    hue.startTimer();
  } else{
    wallNewLocation(xWall, yWall);
  } 
}

void wallNewLocation(int xWall, int yWall){
  boolean newLocation = false;
  if(checkNextTile(xWall - 1, yWall,255,100,255)) if(!newLocation) newLocation = moveWall(newLocation,xWall - 1, yWall, xWall, yWall);
  if(checkNextTile(xWall + 1, yWall,255,100,255)) if(!newLocation) newLocation = moveWall(newLocation,xWall + 1, yWall, xWall, yWall);
  if(checkNextTile(xWall, yWall - 1,255,100,255)) if(!newLocation) newLocation = moveWall(newLocation,xWall, yWall - 1, xWall, yWall);
  if(checkNextTile(xWall, yWall + 1,255,100,255)) if(!newLocation) newLocation = moveWall(newLocation,xWall, yWall + 1, xWall, yWall);
}

boolean moveWall(boolean newLocation, int xNew, int yNew, int xOld, int yOld){
  if(!newLocation){
   if(map != null){
    map.pixels[xOld + yOld * map.width] = color(117,0,0);
    map.pixels[xNew + yNew * map.width] = color(0,0,0);
  }
  return true;
}
return false;
}
}

