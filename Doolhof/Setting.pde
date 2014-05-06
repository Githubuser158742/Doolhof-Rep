class Setting{

	Screen screen;
	Button button;
	ControlP5 cp5;
	boolean render = false;

	Setting(Screen screen){
		this.screen = screen;
		this.cp5 = screen.getCP5();
		addSettingToList();
	}

	void addInputFields(){
		PFont p = createFont("Verdena", 11);
  		cp5.setControlFont(p);
  		cp5.setColorForeground(#ff0000);
  
  		cp5.addTextfield("Width").setPosition((screen.getWidthScreen() / 2) - 50, 50).setSize(200, 40).setFont(p).setFocus(true).setColor(color(255, 0, 0));
  		cp5.addTextfield("Height").setPosition((screen.getWidthScreen() / 2) - 50, 120).setSize(200, 40).setFont(p).setColor(color(255, 0, 0));

  		//1: startwaarde , 2: width, 3: height, 4: x, 5: y
  		cp5.addSlider("TileSize", 1,5,3,(screen.getWidthScreen() / 2) - 50,190,120,20);
  		cp5.addSlider("Scale", 1,5,3,(screen.getWidthScreen() / 2) - 50,260,120,20);
	}

	void addSettingToList(){
		button = new Button(screen);
        button.fillButtonList("setting", "Save", "mainMenu", (screen.getWidthScreen() / 2) - 100, 400, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
	}

	void render(){
		if(!render){
			render = true;
			addInputFields();
		}
		button.render("setting");
	}
}