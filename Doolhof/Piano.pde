class Piano{

	//classes
	Audio audio;
	Keyboard keyboard;
	Screen screen;
	Timer timer1;

	//fields
	int breedte1 = 30;
	int breedte2 = 20;
	int lengte1 = 150;
	int lengte2 = 75;
	int x1 = 10;
	int x2 = 30;
	int x3 = 40;
	int x4 = 60;
	int x5 = 70;
	int x6 = 100;
	int x7 = 120;
	int x8 = 130;
	int x9 = 150;
	int x10 = 160;
	int x11 = 180;
	int x12 = 190;  
	int widthPiano = 230;
	int heightPiano = 150;
	int startX = 0;
	int startY = 0;
	boolean visible = false;
	int maxAantalGeluiden = 3;
	int huidigeGeluid = 0;
	int waarde = 0;
	String geluid = "";
	String gedrukteToets = "";
	boolean succes = false;
	String[] toetsen = new String[maxAantalGeluiden];
	int huidigeToets = 0;
	boolean start = false;
	boolean correct = false;
	boolean falseMessage = false;

	//constructoren
	Piano(Screen screen){
		this.screen = screen;
		this.audio = screen.getAudio();
		this.keyboard = screen.getKeyboard();
	}

	//methods
	//deze methode renderd de piano op scherm
	void render(){	
		this.startX = (screen.getWidthScreen() * screen.getScale() / 2) - (widthPiano / 2);
		this.startY = (screen.getHeightScreen() * screen.getScale() / 2) - (heightPiano / 2);
		renderPiano(0);
		getInput();
		if(timer1 !=null){
			timer1.update();
			if(timer1.time == timer1.length && huidigeGeluid < maxAantalGeluiden){
				startTimer();
				randomGeluid();
				huidigeGeluid++;
			}
		}
	}

	void renderPiano(int toets){
		if(toets != 1) renderRect(x1 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 2) renderRect(x3 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 3) renderRect(x5 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 4) renderRect(x6 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 5) renderRect(x8 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 6) renderRect(x10 + startX, 0 + startY, breedte1, lengte1, color(255,255,255)); 
		if(toets != 7) renderRect(x12 + startX, 0 + startY, breedte1, lengte1, color(255,255,255));
		if(toets != 8) renderRect(x2 + startX, 0 + startY, breedte2, lengte2, color(0,0,0));
		if(toets != 9) renderRect(x4 + startX, 0 + startY, breedte2, lengte2, color(0,0,0));
		if(toets != 10) renderRect(x7 + startX, 0 + startY, breedte2, lengte2, color(0,0,0));
		if(toets != 11) renderRect(x9 + startX, 0 + startY, breedte2, lengte2, color(0,0,0));
		if(toets != 12) renderRect(x11 + startX, 0 + startY, breedte2, lengte2, color(0,0,0));
	}

	void renderRect(int xStart, int yStart, int widthRect, int heightRect, color col){
		fill(col);
		rect(xStart, yStart, widthRect, heightRect);
	}

	//deze methode checked de keyinput mouse en keyboard
	void getInput(){
		getMouseLocation();
		getKeyInput();
	}

	//deze methode checked muis locatie en wanneer er over de toets wordt gehoverd wordt corresponderende geluid afgespeeld
	void getMouseLocation(){
		if(keyboard.mouseLeft && !keyboard.input){
			keyboard.input = true;
			this.startX = (screen.getWidthScreen() * screen.getScale() / 2) - (widthPiano / 2);
			this.startY = (screen.getHeightScreen() * screen.getScale() / 2) - (heightPiano / 2);
			if (mouseX>x1+startX && mouseX<(x1+startX+breedte1)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(1);
			if (mouseX>x2+startX && mouseX<(x2+startX+breedte2)&&mouseY>(startY)&&mouseY<(startY+lengte2)) executeInput(2);
			if (mouseX>x3+startX && mouseX<(x3+startX+breedte1)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(3);
			if (mouseX>x4+startX && mouseX<(x4+startX+breedte2)&&mouseY>(startY)&&mouseY<(startY+lengte2)) executeInput(4);
			if (mouseX>x5+startX && mouseX<(x5+startX+breedte1)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(5);
			if (mouseX>x6+startX && mouseX<(x6+startX+breedte1)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(6);
			if (mouseX>x7+startX && mouseX<(x7+startX+breedte2)&&mouseY>(startY)&&mouseY<(startY+lengte2)) executeInput(7);
			if (mouseX>x8+startX && mouseX<(x8+startX+breedte1)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(8);
			if (mouseX>x9+startX && mouseX<(x9+startX+breedte2)&&mouseY>(startY)&&mouseY<(startY+lengte2)) executeInput(9);
			if (mouseX>x10+startX && mouseX<(x10+startX+breedte2)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(10);
			if (mouseX>x11+startX && mouseX<(x11+startX+breedte1)&&mouseY>(startY)&&mouseY<(startY+lengte2)) executeInput(11);
			if (mouseX>x12+startX && mouseX<(x12+startX+breedte2)&&mouseY>(startY+(lengte1/2))&&mouseY<(startY+lengte1)) executeInput(12);
		}
	}

	//deze methode cheked of er een toets is ingetikt en wordt de corresponderende geluid afgespeeld
	void getKeyInput() {
		if (keyboard.a && !keyboard.input) executeInput(1);
		if (keyboard.b && !keyboard.input) executeInput(2);
		if (keyboard.c && !keyboard.input) executeInput(3);
		if (keyboard.d && !keyboard.input) executeInput(4);
		if (keyboard.e && !keyboard.input) executeInput(5);
		if (keyboard.f && !keyboard.input) executeInput(6);
		if (keyboard.g && !keyboard.input) executeInput(7);
		if (keyboard.h && !keyboard.input) executeInput(8);
		if (keyboard.i && !keyboard.input) executeInput(9);
		if (keyboard.j && !keyboard.input) executeInput(10);
		if (keyboard.k && !keyboard.input) executeInput(11);
		if (keyboard.l && !keyboard.input) executeInput(12);
	}

	void executeInput(int i){
		keyboard.input = true;
		PlayAudio("player" + i);
		gedrukteToets="player" + i;
		ColorPiano(i);
		herkenGeluid();
	}

	//deze methode speeld geluid af en sluit alle andere geluiden af
	void PlayAudio(String name){
		audio.play(name);

		for(int i = 1;i <= 12; i++){
			if(!name.equals("player" + i)) audio.stop("player" + i);
		}
	}

	void startTimer(){
		timer1 = new Timer(1);
	}

	void randomGeluid() {
		int random1 = int(random(1, 12));
		geluid = "player"+random1;
		println(geluid);
		PlayAudio(geluid);
		toetsen[waarde] = geluid;
		waarde++;
		ColorPiano(random1);
	}

	void ColorPiano(int random1){
		this.startX = (screen.getWidthScreen() * screen.getScale() / 2) - (widthPiano / 2);
		this.startY = (screen.getHeightScreen() * screen.getScale() / 2) - (heightPiano / 2);
		if(random1 == 1) renderRect(x1 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 2) renderRect(x2 + startX, 0 + startY, breedte2, lengte2, color(255,0,0));
		if(random1 == 3) renderRect(x3 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 4) renderRect(x4 + startX, 0 + startY, breedte2, lengte2, color(255,0,0));
		if(random1 == 5) renderRect(x5 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 6) renderRect(x6 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 7) renderRect(x7 + startX, 0 + startY, breedte2, lengte2, color(255,0,0));
		if(random1 == 8) renderRect(x8 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 9) renderRect(x9 + startX, 0 + startY, breedte2, lengte2, color(255,0,0));
		if(random1 == 10) renderRect(x10 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
		if(random1 == 11) renderRect(x11 + startX, 0 + startY, breedte2, lengte2, color(255,0,0));
		if(random1 == 12) renderRect(x12 + startX, 0 + startY, breedte1, lengte1, color(255,0,0));
	}

	void herkenGeluid() {
		if(toetsen[huidigeToets].equals(gedrukteToets)==true && !succes) {
			huidigeToets++;
		}
		else if(toetsen[huidigeToets].equals(gedrukteToets)==false && !succes){
			falseMessage = true;
			huidigeToets = 0;
		} 
		if (huidigeToets >= maxAantalGeluiden && !succes){
			succes = true;
			visible = false;
		} 
	}
}