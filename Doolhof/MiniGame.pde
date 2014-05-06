class MiniGame{

	Piano piano;
	Hue hue;

	//fields
	ArrayList<String> miniGameList = new ArrayList();

	String name;
	int index = 0;

	//constructoren
	//deze constructor vult miniGameList op
	MiniGame(Piano piano, Hue hue){
		this.piano = piano;
		this.hue = hue;
		miniGameList.add("piano");
		miniGameList.add("hue");
	}

	Piano getPiano(){
		return piano;
	}

	Hue getHue(){
		return hue;
	}
}