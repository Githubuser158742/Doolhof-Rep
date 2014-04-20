class ReadWriteFile{

	//fields
	ArrayList<String> levelList = new ArrayList(); //lijst met alle levels, worden auto gezogd aan de hand of file bestaat 
	ArrayList<Data> dataList = new ArrayList(); //lijst met data van ingelezen file, player stats
	
	//classes
	BufferedReader reader;
	Data data = new Data();

	//constructoren
	//deze constructor krijgt een path binnen en zal kijken of file met player stats bestaat, zo niet zal hij er één aanmaken
	ReadWriteFile(String path){
		if(fileExists(path)) reader = createReader(dataPath(path));  
		else {
			try{
				PrintWriter output = new PrintWriter(new BufferedWriter(new FileWriter(dataPath(path), false)));//appending is op false gezet
				output.close();
			} catch(Exception e){
			}
		}
	}

	//methods
	/*
	deze methode zal de file lijn per lij inlezen en in 2 stukken verdelen name en value
	name = naam van field er de waarde van moet ingevuld worden
	value = de waarde
	dit wordt dan in een data object gestopt en deze zal dan aan de data lijst worden toegevoegd
	*/
	void readTekstFile(){
		String line = readLine();
  		while(line != null) {
    		String[] pieces = split(line, "=");
    		String name = pieces[0];
    		String value = pieces[1];
    		dataList.add(data.fillDataList(name, value));
    		line = readLine();
  		}  		
	}

	//deze methode krijgt een path binnen en zal daarmee elke rij in data lijst wegschrijven naar een file
	void writeToFile(String path){
		try{
			PrintWriter output = new PrintWriter(new BufferedWriter(new FileWriter(dataPath(path), false))); //appending is op false gezet
			for(int i = 0; i < dataList.size(); i++){
				output.println(dataList.get(i).name + "=" + dataList.get(i).value); //name=value
			}
		output.close();
		} catch(Exception e){
		}
	}

	//deze methode zal naar alle level sprites zoeken en deze aan de level lijst toevoegen
	void readLevelSprites(){
		int index = 1;
		while(fileExists("sheets/level" + index + ".png")){
			levelList.add("level" + index);
			index++;
		}
	}

	//functies
	//deze functie kijkt of bepaalde file bestaat en geeft dan true of false terug
	boolean fileExists(String filename) {
 		File file = new File(dataPath(filename));
 		if(!file.exists()) return false;
 		return true;
	}

	//deze functie leest de lijnen van file in
	String readLine(){
		String line;
		try {
    		line = reader.readLine();
  		} catch (Exception e) {
    		e.printStackTrace();
    		line = null;
  		}
  		return line;
	}
}