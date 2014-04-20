class Piano{

	//classes
	Audio audio;
	Keyboard keyboard;
	Screen screen;

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
	boolean visible = false;
	Timer timer1;
	Timer timer2;

	//constructoren
	Piano(Screen screen){
		this.screen = screen;
 		this.audio = screen.getAudio();
 		this.keyboard = screen.getKeyboard();
	}

	//methods
	//deze methode renderd de piano op scherm
	void render(){	
  		fill(255);
  		rect(x1, 0, breedte1, lengte1);
  		rect(x3, 0, breedte1, lengte1);
  		rect(x5, 0, breedte1, lengte1);
  		rect(x6, 0, breedte1, lengte1);
  		rect(x8, 0, breedte1, lengte1);
  		rect(x10, 0, breedte1, lengte1); 
  		rect(x12, 0, breedte1, lengte1);

  		fill(0);
  		rect(x2, 0, breedte2, lengte2);
  		rect(x4, 0, breedte2, lengte2);
  		rect(x7, 0, breedte2, lengte2);
  		rect(x9, 0, breedte2, lengte2);
  		rect(x11, 0, breedte2, lengte2);
  		getInput();
  		if(timer1 !=null){
  			timer1.update();
  			if(timer1.time == timer1.length) println("timer1");
  		}
  		if(timer2 !=null){
  			timer2.update();
  			if(timer2.time == timer2.length) println("timer2");
  		}
	}

	//deze methode checked de keyinput mouse en keyboard
	void getInput(){
		getMouseLocation();
		getKeyInput();
	}

	//deze methode checked muis locatie en wanneer er over de toets wordt gehoverd wordt corresponderende geluid afgespeeld
	void getMouseLocation(){
		if (mouseX>x1 && mouseX<(x1+breedte1)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player1");
		if (mouseX>x2 && mouseX<(x2+breedte2)&&mouseY<(lengte2)) PlayAudio("player2");
        if (mouseX>x3 && mouseX<(x3+breedte1)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player3");
		if (mouseX>x4 && mouseX<(x4+breedte2)&&mouseY<(lengte2)) PlayAudio("player4");
  		if (mouseX>x5 && mouseX<(x5+breedte1)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player5");
		if (mouseX>x6 && mouseX<(x6+breedte1)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player6");
		if (mouseX>x7 && mouseX<(x7+breedte2)&&mouseY<(lengte2)) PlayAudio("player7");
		if (mouseX>x8 && mouseX<(x8+breedte1)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player8");
		if (mouseX>x9 && mouseX<(x9+breedte2)&&mouseY<(lengte2)) PlayAudio("player9");
  		if (mouseX>x10 && mouseX<(x10+breedte2)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player10");
		if (mouseX>x11 && mouseX<(x11+breedte2)&&mouseY<(lengte2)) PlayAudio("player11");
  		if (mouseX>x12 && mouseX<(x12+breedte2)&&mouseY<(lengte1)&&mouseY>(lengte2)) PlayAudio("player12");
	}

	//deze methode cheked of er een toets is ingetikt en wordt de corresponderende geluid afgespeeld
	void getKeyInput(){
		if (keyboard.a) PlayAudio("player1");
		if (keyboard.b) PlayAudio("player2");
        if (keyboard.c) PlayAudio("player3");
		if (keyboard.d) PlayAudio("player4");
  		if (keyboard.e) PlayAudio("player5");
		if (keyboard.f) PlayAudio("player6");
		if (keyboard.g) PlayAudio("player7");
		if (keyboard.h) PlayAudio("player8");
		if (keyboard.i) PlayAudio("player9");
  		if (keyboard.j) PlayAudio("player10");
		if (keyboard.k) PlayAudio("player11");
  		if (keyboard.l) PlayAudio("player12");
	}

	//deze methode speeld geluid af en sluit alle andere geluiden af
	void PlayAudio(String name){
		audio.play(name);

		for(int i = 1;i <= 12;i++){
			if(!name.equals("player" + i)) audio.stop("player" + i);
		}
	}

	void randomGeluid() {
    	Float random1 = random(1,12);
    	int random2 = round(random1);
    	String feest = "player"+random2;
    	println(feest);
    	PlayAudio(feest);
    	
    	timer1 = new Timer(3);
    
    	Float random3 = random(1,12);
    	int random4 = round(random3);
    	String feest2 = "player"+random4;
    	println(feest2);
    	PlayAudio(feest2);
   
    	timer2 = new Timer(3);
    
    	Float random5 = random(1,12);
    	int random6 = round(random5);
    	String feest3 = "player"+random6;
    	println(feest3);
    	PlayAudio(feest3); 
  	}
}