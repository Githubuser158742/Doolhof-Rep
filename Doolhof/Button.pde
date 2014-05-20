class Button{

	//fields
	ArrayList<Button> buttonList = new ArrayList();

	String group;
	String name;
	String location;
	int xStart;
	int yStart;
	int widthButton;
	int heightButton;
	color background;
	color tekstColor;
	int size;
	int textXStart;
	int textYStart;
	String letterType;
	boolean enableButton;
	boolean centerTekst;

	//classes
	Player player;
	Screen screen;
	Audio audio;

	//constructoren
	Button(Screen screen){
		this.screen = screen;
		//println(screen);
		this.player = screen.getPlayer();
		audio = screen.getAudio();
	}

	//methods
	//deze methode zal buttons aanmaken en deze aan button lijst toevoegen
	void fillButtonList(String group, String name, String location, int xStart, int yStart, int widthButton, int heightButton, color background, color tekstColor, int size, int textXStart, int textYStart, String letterType, boolean enableButton, boolean centerTekst){
		Button button = new Button(screen);
		button.group = group;
		button.name = name;
		button.location = location;
		button.xStart = xStart;
		button.yStart = yStart;
		button.widthButton = widthButton;
		button.heightButton = heightButton;
		button.background = background;
		button.tekstColor = tekstColor;
		button.size = size;
		button.textXStart = textXStart;
		button.textYStart = textYStart;
		button.letterType = letterType;
		button.enableButton = enableButton;
		button.centerTekst = centerTekst;
		buttonList.add(button);
	}

	//deze methode zal via de grpup de buttons van die groep de waarden in variabelen stoppen
	void render(String groupName){
		for(int i = 0; i < buttonList.size(); i++){
			if(buttonList.get(i).group == groupName){
				String name = buttonList.get(i).name;
				int xStart = buttonList.get(i).xStart;
				int yStart = buttonList.get(i).yStart;
				int widthButton = buttonList.get(i).widthButton;
				int heightButton = buttonList.get(i).heightButton;
				color background = buttonList.get(i).background;
				color tekstColor = buttonList.get(i).tekstColor;
				int size = buttonList.get(i).size;
				int textXStart = buttonList.get(i).textXStart;
				int textYStart = buttonList.get(i).textYStart;
				String letterType = buttonList.get(i).letterType;
				boolean centerTekst = buttonList.get(i).centerTekst;
				renderButtons(name, xStart, yStart, widthButton, heightButton, background, tekstColor, size, textXStart, textYStart, letterType, centerTekst);
			}
		}
		checkInput(groupName);
	}

	//deze methode zal elke button van bepaalde groep renderen naar scherm
	void renderButtons(String name, int xStart, int yStart, int widthButton, int heightButton, color background, color tekstColor, int size, int textXStart, int textYStart, String letterType, boolean centerTekst){
		PFont f = createFont(letterType,size,true); //aliasing
		fill(background);
		rect(xStart,yStart,widthButton,heightButton);
		textFont(f,size);
		fill(tekstColor);
		if(centerTekst){
			textAlign(CENTER, CENTER);
			text(name,xStart + (widthButton / 2) + textXStart,yStart + (heightButton / 2) + textYStart);
		}else{
			textAlign(LEFT);
			text(name,xStart + textXStart,yStart + textYStart);
		}
	}

	//deze methode zal kijken wat voor soort input er op gechecked worden
	void checkInput(String groupName){
		getMouseLocation(groupName);
	}

	//deze methode kijk naar mouse input
	void getMouseLocation(String groupName){
		checkLocation(groupName);
	}

	//deze methode zal de muis mocatie opvragen en kijken op welke button er is geklikt en dan de locatie meegeven naar player
	void checkLocation(String groupName){
		boolean mouseOver = false;
		for(int i = 0; i < buttonList.size(); i++){
			if((buttonList.get(i).group == groupName) && (buttonList.get(i).enableButton)){
				String name = buttonList.get(i).name;
				int xStart = buttonList.get(i).xStart;
				int yStart = buttonList.get(i).yStart;
				int widthButton = buttonList.get(i).widthButton;
				int heightButton = buttonList.get(i).heightButton;
				color background = buttonList.get(i).background;
				color tekstColor = buttonList.get(i).tekstColor;
				int size = buttonList.get(i).size;
				int textXStart = buttonList.get(i).textXStart;
				int textYStart = buttonList.get(i).textYStart;
				String letterType = buttonList.get(i).letterType;
				boolean centerTekst = buttonList.get(i).centerTekst;
				String location = buttonList.get(i).location;
				if((mouseX > xStart && mouseX < xStart + widthButton) && (mouseY > yStart && mouseY < yStart + heightButton)){
					cursor(HAND);
					mouseOver = true;
					renderButtons(name, xStart, yStart, widthButton, heightButton, color(255,0,0), tekstColor, size, textXStart, textYStart, letterType, centerTekst);
					if(keyboard.mouseLeft && !keyboard.input){
						keyboard.input = true;
						audio.play("playerButton");
						player.location = location;
					} 
				}
			}
		}
		if(!mouseOver) {
			cursor(ARROW);
			audio.stop("playerButton");
		}
	}
}