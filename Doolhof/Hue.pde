class Hue{

	HueHub hub;
	HueLight light;
	Timer timer1;
	Keyboard keyboard;
	Screen screen;
	PImage img;

	boolean visible = false;
	String[] colorArray;
	String[] colorGameArray;
	boolean on = false;
	int getal = 0;
	int index = 0;
	int inputIndex = 0;
	int aatalColors = 3;
	String col = "";
	boolean lightOn = false;
	boolean succes = false;
	boolean hueOnline = false;
	boolean start = false;
	boolean correct = false;
	boolean falseMessage = false;

	Hue(Screen screen){
		this.screen = screen;
		this.keyboard = screen.getKeyboard();
		this.img = loadImage("data/sheets/lamp.png");
		if(hueOnline){
			hub = new HueHub(); 
			light = new HueLight(3, hub);
			light.turnOff();
		}
		colorArray = new String[6];
		colorArray[0] = "red";
		colorArray[1] = "oranje";
		colorArray[2] = "blue";
		colorArray[3] = "white";
		colorArray[4] = "yellow";
		colorArray[5] = "purple";
	}

	void init(){
		colorGameArray = new String[3];
		on = false;
		getal = 0;
		index = 0;
		inputIndex = 0;
		col = "";
		lightOn = false;
		succes = false;
		hueOnline = false;
		start = false;
		correct = false;
		falseMessage = false;
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

	void renderImage(){
		int x = (screen.getWidthScreen() * screen.getScale() / 2);
		int y = (screen.getHeightScreen() * screen.getScale() / 2);
		image(img, x - (img.width / 2), y - (img.height / 2) + 85, img.width, img.height);
		noFill();
		ellipse((screen.getWidthScreen() * screen.getScale() / 2),(screen.getHeightScreen() * screen.getScale() / 2),150,150);
	}

	void render(){
		getKeyInput();
		renderImage();
		if(timer1 !=null){
			timer1.update();
			renderRect();
			if(timer1.time == timer1.length && index < aatalColors + 1){
				startTimer();
				if(!lightOn && index < aatalColors){
					lightOn = true;
					assignColor();
					col = colorGameArray[index];
					if(hueOnline) light.turnOn(getal,255,255);
					if(index < aatalColors) index++;
				}else{
					lightOn = false;
					if(hueOnline) light.turnOff();
					col = "";
				}
			}
		}
	}

	void renderRect(){
		if(col.equals("red")) fill(color(255,0,0));
		if(col.equals("oranje")) fill(color(255,140,0));
		if(col.equals("blue")) fill(color(0,0,255));
		if(col.equals("yellow")) fill(color(255,255,0));
		if(col.equals("white")) fill(color(255,255,255));
		if(col.equals("purple")) fill(color(255,0,255));
		if(col != "") ellipse((screen.getWidthScreen() * screen.getScale() / 2),(screen.getHeightScreen() * screen.getScale() / 2),150,150);
	}

	void getKeyInput() {
		/*if (keyboard.a && !keyboard.input) executeInput(1);
		if (keyboard.b && !keyboard.input) executeInput(2);
		if (keyboard.c && !keyboard.input) executeInput(3);
		if (keyboard.d && !keyboard.input) executeInput(4);
		if (keyboard.e && !keyboard.input) executeInput(5);
		if (keyboard.f && !keyboard.input) executeInput(6);*/

		if (keyboard.w && !keyboard.input) executeInput(1);
		if (keyboard.a && !keyboard.input) executeInput(2);
		if (keyboard.s && !keyboard.input) executeInput(3);
		if (keyboard.d && !keyboard.input) executeInput(4);
		if (keyboard.f && !keyboard.input) executeInput(5);
		if (keyboard.g && !keyboard.input) executeInput(6);
		if(keyboard.input) executeInput(0);
	}

	void executeInput(int key){
		keyboard.input = true;
		if(key == 0 && hueOnline) light.turnOff();
		if(key == 1) {
			if(colorGameArray[inputIndex].equals("red")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(0,255,255);
			renderRect();
			col = "red";
		}
		if(key == 2){
			if(colorGameArray[inputIndex].equals("oranje")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(10000,255,255);
			renderRect();
			col = "oranje";
		}
		if(key == 3){
			if(colorGameArray[inputIndex].equals("blue")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(45000,255,255);
			renderRect();
			col = "blue";
		} 
		if(key == 4){
			if(colorGameArray[inputIndex].equals("yellow")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(20000,255,255);
			renderRect();
			col = "yellow";
		} 
		if(key == 5){
			if(colorGameArray[inputIndex].equals("white")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(30000,255,255);
			renderRect();
			col = "white";
		} 
		if(key == 6){
			if(colorGameArray[inputIndex].equals("purple")) incrementIndex();
			else {
				inputIndex = 0;
				falseMessage = true;
			}
			if(hueOnline) light.turnOn(55000,255,255);
			renderRect();
			col = "purple";
		}
	}

	void incrementIndex(){
		if(inputIndex < aatalColors-1) inputIndex++;
		else {
			succes = true;
			visible = false;
		}
	}
}