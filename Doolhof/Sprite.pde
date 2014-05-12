class Sprite {

//classes   
ReadWriteFile file;
Screen screen;

	//fields
int tileMultiplier = 3; //meestal hetzelfde als scale, schaling van tiles, bij inlezen van file kan deze waarde worden veranderd
int tileSize = 4; //groote van tile er wordt geshift in plaats van * of / omdat << en >> sneller is 4 * 4 = 16 pixels

//constructoren
/*
deze constructor krijgt als parameter de instantie van class ReadWriteFile binnen om ervoor te zorgen dat er maar 1 instantie is van ReadWriteFile
hij zal de lijst met data van ingelezen file overlopen en kijken of tileMultiplier bestaat en zo ja geeft hij tileMultiplier een nieuwe waarde
*/
Sprite(Screen screen){
	this.screen = screen;
	this.file = screen.getReadWriteFile();
	for(int i = 0; i < file.dataList.size();i++){
		if(file.dataList.get(i).name.equals("tileMultiplier") && file.dataList.get(i).value != "") tileMultiplier = int(file.dataList.get(i).value);
	}
}

//functies
//deze functie geeft de tileSize terug
int getTileSize(){
	return tileSize;
}

//deze functie geeft de tileMultiplier terug
int getTileMultiplier(){
	return tileMultiplier;
}

//deze functie geeft de getPixelSize terug
int getPixelSize(){
	return tileSize * tileSize;
}

/* colors
	void == water
	0 255 0 == grassL
	0 155 0 == grassD
	117 0 0 == wood
	160 160 160 == wallR
	0 0 0 == wallB
	100 100 100 == end
	100 100 255 == start
	55 100 255 == wallMove */

//deze functie geeft de locatie x-as van tile in sprite sheet terug aan de hand van de naam tile
int getX(String name){
	//map tiles
	if(name.equals("water")) return 32;
	if(name.equals("grassL")) return 16;
	if(name.equals("grassD")) return 0;
	if(name.equals("wood")) return 16;
	if(name.equals("wallR")) return 0;
	if(name.equals("wallB")) return 0; //interactieve muren die verplaatst kunnen worden
	if(name.equals("wallMove")) return 16; //eind bestemming interactieve muren die verplaatst kunnen worden
	if(name.equals("start")) return 16; //spawn locatie
	if(name.equals("end")) return 16; //eind bzstemming

	//player tiles, 0,1,2 zijn de wandel animatie player
	if(name.equals("up0")) return 16;
	if(name.equals("up1")) return 32;
	if(name.equals("up2")) return 0;
	if(name.equals("down0")) return 16;
	if(name.equals("down1")) return 32;
	if(name.equals("down2")) return 0;
	if(name.equals("left0")) return 16;
	if(name.equals("left1")) return 32;
	if(name.equals("left2")) return 0;
	if(name.equals("right0")) return 16;
	if(name.equals("right1")) return 32;
	if(name.equals("right2")) return 0;
	return 32; //standaard wordt er water teruggegeven omdat deze een void tile is ==> zou niet mogen voorvallen
}

//deze functie geeft de locatie y-as van tile in sprite sheet terug aan de hand van de naam tile
int getY(String name){
	//map tiles
	if(name.equals("water")) return 0;
	if(name.equals("grassL")) return 0;
	if(name.equals("grassD")) return 0;
	if(name.equals("wood")) return 16;
	if(name.equals("wallR")) return 16;
	if(name.equals("wallB")) return 32; //interactieve muren die verplaatst kunnen worden
	if(name.equals("wallMove")) return 16; //eind bestemming interactieve muren die verplaatst kunnen worden
	if(name.equals("start")) return 16; //spawn locatie
	if(name.equals("end")) return 32; //eind bzstemming

	//player tiles, 0,1,2 zijn de wandel animatie player
	if(name.equals("up0")) return 48;
	if(name.equals("up1")) return 48;
	if(name.equals("up2")) return 48;
	if(name.equals("down0")) return 0;
	if(name.equals("down1")) return 0;
	if(name.equals("down2")) return 0;
	if(name.equals("left0")) return 16;
	if(name.equals("left1")) return 16;
	if(name.equals("left2")) return 16;
	if(name.equals("right0")) return 32;
	if(name.equals("right1")) return 32;
	if(name.equals("right2")) return 32;
	return 0; //standaard wordt er water teruggegeven omdat deze een void tile is ==> zou niet mogen voorvallen
}

//deze functie krijgt als param een path mee en geeft dan de image terug van de volledige spritesheet
PImage getSpriteSheet(String path){
	return loadImage(path);
}

/*
deze functie krijgt als param een naam, breedte tile, hoogte tile en de spritesheet mee
met deze waarden zal hij dan een tile teruggeven
*/
PImage getSprite(String name, int xSize, int ySize, PImage spriteSheet){
	int xStart = getX(name);
	int yStart = getY(name);
	PImage sprite = createImage(spriteSheet.width, spriteSheet.height, ARGB);
	//image, start x-waarde, start y-waarde, breedte tile , lengte tile, offset x-as, offset y-as, breedte spritesheet en hoogte spritesheet
	//offset is op tile zelf en zal zoveel aantal pixels van tile niet renderen
	sprite.copy(spriteSheet, xStart, yStart, xSize, ySize, 0, 0, spriteSheet.width, spriteSheet.height);
	return sprite;
}
}
