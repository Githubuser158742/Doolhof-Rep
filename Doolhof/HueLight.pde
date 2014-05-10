class HueLight {
  private int id; // lamp number/ID as known by the hub, e.g. 1,2,3
  // light variables
  private int hue = 30000; // hue value for the lamp
  private int saturation = 255; // saturation value
  private int  brightness = 255; // brightness
  private boolean lightOn = false; // is the lamp on or off, true if on?
  private byte transitiontime = 0; // transition time, how fast  state change is executed -> 1 corresponds to 0.1s
  // hub variables
  private HueHub hub; // hub to register at
  private String name = "noname"; // set when registering the lamp with the hub
  // graphic settings
  private byte radius = 80; // size of the ellipse drawn on screen
  private int x; // x position on screen
  private int y; // y position on screen
  // control variables
  private float damping = 0.9; // control how fast dim() impacts brightness and lights turn off
  private float flashDuration = 0.2; // in approx. seconds
  private float frameCounter; // keeps track of number of frames drawn and turns light off when ==0

  // constructor, requires light ID and hub
  public HueLight(int lightID, HueHub aHub) {
    id = lightID;
    hub = aHub;
    // check if registered, get name [not implemented]
    name = hub.getLightName(this);
  }

  // cycle thrue the colors
  public void incHue() {
    hue += 1000;
    setHue(hue);
  }

  // set the hue value; if outside bounds set to min/max allowed
  public void setHue(int hueValue) {
    hue = hueValue;
    if (hue < 0 || hue > 65532) {
      hue = 0;
    }
  }

  // set the brightness value, max 255
  public void setBrightness(byte bri) {
    brightness = bri;
  }

  // set the saturation value, max 255
  public void setSaturation(int sat) {
    saturation = sat;
  }

  // set the tranistion time; 1 = 0.1sec (not sure if there is a max)
  public void setTransitiontime(byte transTime) {
    transitiontime = transTime;
  }

  // returns true if the light is on (based on last state change, not a query of the light) 
  public boolean isOn() {
    return this.lightOn;
  }

  /*
   have the changes to the settings applied to the lamp & visualize; this
   calls the hub which handles the actual updates of the lights
   */
  public void update() {
    hub.applyState(this);
    // debugging
    // println("send update " + id);
  }

  // convenience method to turn the light off
  public void turnOff() {
    this.lightOn = false;
    update();
  }

  /* 
   turn on the light for <duration> ms; compensates for transition time 
   if duration = 2000 ms and fps = 20 -> #frames = (2000 / 1000) / (1/20) = 40 frames
   transition is subtracted before framecount is calculated
   */
  public void flashLight(float duration) {
    float durationOn = duration - (transitiontime * 100); // transition time of 1 = 0.1s = 100ms
    // translate the duration in ms to number of frames
    frameCounter = (duration/1000) / (1/frameRate);
    lightOn = true;
    // println("on for " + duration + "[ms], translates to " + frameCounter + "[frames] with fps " + frameRate);
    update();
  }

  // convenience method to turn the light on
  public void turnOn() {
    this.lightOn = true;
    update(); // apply new state
  }

  // convenience method to turn the light on with some passed settings
  public void turnOn(int hue, int brightness) {
    this.lightOn = true;
    this.hue = hue;
    this.brightness = brightness;
    update(); // apply new state
  }

  public void turnOn(int hue, int sat, int brightness) {
    this.lightOn = true;
    this.hue = hue;
    this.saturation = sat;
    this.brightness = brightness;
    update(); // apply new state
  }

  /* 
   return data with lamp settings, JSON formatted string, to be send to hub
   sometimes after a while you get an error message that the light is off
   and it won’t change, even when it’s actually on. You can work around 
   this by always turning the light on first. 
   */
  public String getData() {
    StringBuilder data = new StringBuilder("{");
    data.append("\"on\" :"); 
    data.append(lightOn);
    // only if the light is on we need the rest
    if (lightOn) {
      data.append(", \"hue\":");
      data.append(hue);
      data.append(", \"bri\":");
      data.append(brightness);
      data.append(", \"sat\":");
      data.append(saturation);
    }
    // always send transition time, to control how fast the state is changed
    data.append(", \"transitiontime\":");
    data.append(transitiontime);
    data.append("}");
    return data.toString();
  }

  // get current values
  public int getBrightness() {
    return brightness;
  }

  public int getSaturation() {
    return saturation;
  }

  public int getHue() {
    return hue;
  }

  public int getID() {
    return id;
  }

  /*
   dim the light using damping factor; if brightness < x and lighton then turn if
   this could allow for smoother on/off changes but also risk for hub errors (to any changes) 
   */
  public void dim() {
    brightness *= damping;
    if (brightness < 20 && lightOn) { // 20 is arbitrary threshold, could be higher/lower
      brightness = 0;
      lightOn=false;
      update();
    }
  }
}