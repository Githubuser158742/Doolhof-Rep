class Data{

	/*
	ingelezen file bestaat uit name=value
	*/

	//fields
	String name; //name ==> wat de variable zal doen
	String value; //de waarde

	//constructoren

	//functies
	//deze functie krijgt als param een naam een value binnen
	Data fillDataList(String name, String value){
		Data data = new Data();
		data.name = name;
		data.value = value;
		return data;
	}

	//deze functie krijgt als param een naam een value binnen
	Data fillDataList(String name, int value){
		Data data = new Data();
		data.name = name;
		data.value = str(value);
		return data;
	}
}