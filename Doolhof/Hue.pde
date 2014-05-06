class Hue{

	HueHub hub;
	HueLight light;

	boolean visible = false;
	String[] colorArray;
	String[] colorGameArray;

	Hue(){
  		hub = new HueHub();  
  		light = new HueLight(1, hub);
  		colorArray = new String[6];
  		colorGameArray = new String[3];
  		colorArray[0] = "red";
  		colorArray[1] = "green";
  		colorArray[2] = "blue";
  		colorArray[3] = "white";
		colorArray[4] = "yellow";
		colorArray[5] = "purple";

		for(int i = 0; i < 3; i++){
			int c = int(random(0,colorArray.length));
			colorGameArray[i] = colorArray[c];
		}
	}

	void render(){
		String col = colorGameArray[0];
		if(col.equals("red")) fill(color(255,0,0));
		if(col.equals("green")) fill(color(0,255,0));
		if(col.equals("blue")) fill(color(0,0,255));
		if(col.equals("yellow")) fill(color(255,255,0));
		if(col.equals("white")) fill(color(255,255,255));
		if(col.equals("purple")) fill(color(255,0,255));
		ellipse(100,100,50,50);
	}
}