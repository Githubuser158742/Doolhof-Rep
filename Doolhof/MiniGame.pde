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

	void incrementIndex(){
		if(index+1 >= miniGameList.size()) index = 0;
		index++;
	}

	Piano getPiano(){
		return piano;
	}

	Hue getHue(){
		return hue;
	}
}