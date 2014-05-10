class Hue{

	HueHub hub;
	HueLight light;
	Timer timer1;
	Keyboard keyboard;
	Screen screen;

	boolean visible = false;
	String[] colorArray;
	String[] colorGameArray;
	boolean on = false;
	int getal = 0;
	int index = 0;
	int aatalColors = 3;
	String col = "";
	boolean lightOn = false;

	Hue(Screen screen){
		this.screen = screen;
		this.keyboard = screen.getKeyboard();
		hub = new HueHub();  
		light = new HueLight(1, hub);
		light.turnOff();
		colorArray = new String[6];
		colorGameArray = new String[3];
		colorArray[0] = "red";
		colorArray[1] = "oranje";
		colorArray[2] = "blue";
		colorArray[3] = "white";
		colorArray[4] = "yellow";
		colorArray[5] = "purple";

		for(int i = 0; i < aatalColors; i++){
			int c = int(random(0,colorArray.length));
			colorGameArray[i] = colorArray[c];
		}
	}

	void assignColor(){
		String col = colorGameArray[index];
		if(col.equals("red")) getal = 0;
		if(col.equals("oranje")) getal = 10000;
		if(col.equals("blue")) getal = 45000;
		if(col.equals("yellow")) getal = 20000;
		if(col.equals("white")) getal = 30000;
		if(col.equals("purple")) getal = 55000;
	}

	void startTimer(){
		timer1 = new Timer(2);
	}

	void render(){
		getKeyInput();
		if(timer1 !=null){
			timer1.update();
			if(timer1.time == timer1.length && index < aatalColors + 1){
				startTimer();
				if(!lightOn && index < aatalColors){
					lightOn = true;
					assignColor();
					col = colorGameArray[index];
					light.turnOn(getal,255,255);
					if(index < aatalColors) index++;
				}else{
					lightOn = false;
					light.turnOff();
				}
			}
		}

		if(col.equals("red")) fill(color(255,0,0));
		if(col.equals("oranje")) fill(color(255,140,0));
		if(col.equals("blue")) fill(color(0,0,255));
		if(col.equals("yellow")) fill(color(255,255,0));
		if(col.equals("white")) fill(color(255,255,255));
		if(col.equals("purple")) fill(color(255,0,255));
		if(col != "") ellipse((screen.getWidthScreen() * screen.getScale() / 2),(screen.getHeightScreen() * screen.getScale() / 2),75,75);
	}

	void getKeyInput() {
		if (keyboard.a && !keyboard.input) executeInput(1);
		if (keyboard.b && !keyboard.input) executeInput(2);
		if (keyboard.c && !keyboard.input) executeInput(3);
		if (keyboard.d && !keyboard.input) executeInput(4);
		if (keyboard.e && !keyboard.input) executeInput(5);
		if (keyboard.f && !keyboard.input) executeInput(6);
		if(keyboard.input) executeInput(0);
	}

	void executeInput(int key){
		if(key == 0) light.turnOff();
		if(key == 1) light.turnOn(0,255,255);
		if(key == 2) light.turnOn(10000,255,255);
		if(key == 3) light.turnOn(45000,255,255);
		if(key == 4) light.turnOn(20000,255,255);
		if(key == 5) light.turnOn(30000,255,255);
		if(key == 6) light.turnOn(55000,255,255);
	}
}