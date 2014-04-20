class Timer{

	//fields
	int time = 0; //de tijd
	int length = 0; //hoe lang duurd deze timer in seconden

	//constructoren
	//deze constructor krijgt als parameter hoe lang de timer moet duren
	Timer(int length){
		this.length = length * 24; //de framerate is beperkt tot 24 fps: dus 24 frames = 1 seconde
	}

	//method update()
	// verhoogt de time variable met 1 per kerr de methode wordt aangeroepen
	void update(){
		time++;
	}
}