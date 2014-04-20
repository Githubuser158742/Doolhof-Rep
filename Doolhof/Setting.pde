class Setting{

	Screen screen;
	Button button;
	ControlP5 inputFieldWidth;
	ControlP5 inputFieldHeight;
	ControlP5 inputFieldTileSize;
	ControlP5 inputFieldScale;

	Setting(Screen screen){
		this.screen = screen;
		/*inputFieldWidth = new ControlP5(this);
		inputFieldHeight = new ControlP5(this);
		inputFieldTileSize = new ControlP5(this);
		inputFieldScale = new ControlP5(this);*/
		addSettingToList();
		addInputFields();
	}

	void addInputFields(){
		PFont p = createFont("Verdena", 11);
  		inputFieldTileSize.setControlFont(p);
  		inputFieldTileSize.setColorForeground(#ff0000);
  		inputFieldScale.setControlFont(p);
  		inputFieldScale.setColorForeground(#ff0000);
  
  		inputFieldWidth.addTextfield("inputFieldWidth").setPosition((screen.getWidthScreen() / 2) - 50, 50).setSize(200, 40).setFont(p).setFocus(true).setColor(color(255, 0, 0));
  		inputFieldHeight.addTextfield("inputFieldHeight").setPosition(20, 100).setSize((screen.getWidthScreen() / 2) - 50, 100).setFont(p).setColor(color(255, 0, 0));

  		inputFieldTileSize.addSlider("inputFieldTileSize", 10,450,50,50,50,120,20);
  		inputFieldScale.addSlider("inputFieldScale", 1,10,5,50,80,120,40);
	}

	void addSettingToList(){
		button = new Button(screen);
        button.fillButtonList("setting", "Save", "mainMenu", (screen.getWidthScreen() / 2) - 100, 500, 200, 50, color(0,0,80), color(255,255,255), 20, 0, -5, "Arial", true, true);
	}

	void render(){
		button.render("setting");
	}
}