class MiniGame{

	Piano piano;

	//fields
	ArrayList<String> miniGameList = new ArrayList();

	String name;
	int index = 0;

	//constructoren
	//deze constructor vult miniGameList op
	MiniGame(Piano piano){
		this.piano = piano;
		miniGameList.add("piano");
	}

	Piano getPiano(){
		return piano;
	}
}