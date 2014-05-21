class Keyboard {

    //fields
    boolean left, right, up, down = false; //arow key input
    boolean save, saveImage = false; //save data player, save current screen
    boolean a, b, c, d, e, f, g, h, i, j, k, l, m, w, s, q = false;
    boolean space = false; //interactie met bepaaldee voorwerpen
    boolean mouseLeft = false; //mouse input left
    boolean input = false; //begrenzer zodat er maar 1 x een actie wordt uitgevoerd per render

    ArrayList<String> keyList = new ArrayList(); //lijst met begrensde keys voor maar 1 x een actie uit te voeren

    //constructoren
    //deze constructor vult lijst met alle begrensde keys
    Keyboard(){
      keyList.add(" ");
      keyList.add("a");
      keyList.add("b");
      keyList.add("c");
      keyList.add("d");
      keyList.add("e");
      keyList.add("f");
      keyList.add("g");
      keyList.add("h");
      keyList.add("i");
      keyList.add("j");
      keyList.add("k");
      keyList.add("l");
      keyList.add("m");
      keyList.add("w");
      keyList.add("s");
      keyList.add("q");
      keyList.add("z");
      keyList.add("mouseLeft");
      keyList.add("left");
      keyList.add("right");
      keyList.add("UP");
      keyList.add("DOWN");
      keyList.add("up");
      keyList.add("down");
    }

    //methods
    //deze methode kijkt over een key is ingedrukt en zet dan de corresponderende variable op true
    void checkKeyPressed(){
        //speciale keys
        if(key == CODED){
          if (keyCode == LEFT) left = true;
          if (keyCode == RIGHT) right = true;
          if (keyCode == UP) up = true;
          if (keyCode == DOWN) down = true;
            //if (keyCode == VK_F2) saveImage = true;
          }
        //normale keys
        /*if (key == ' ') space = true;
        if (key == 's') save = true;
        if (key == 'z') saveImage = true;
        if (key == 'a') a = true;
        if (key == 'b') b = true;
        if (key == 'c') c = true;
        if (key == 'd') d = true;
        if (key == 'e') e = true;
        if (key == 'f') f = true;
        if (key == 'g') g = true;
        if (key == 'h') h = true;
        if (key == 'i') i = true;
        if (key == 'j') j = true;
        if (key == 'k') k = true;
        if (key == 'l') l = true;
        if (key == 'm') m = true;
        if (key == 'w') w = true;*/

        if (key == ' ') space = true;
        if (key == 'w') w = true;
        if (key == 'a') a = true;
        if (key == 's') s = true;
        if (key == 'd') d = true;
        if (key == 'f') f = true;
        if (key == 'g') g = true;
      }

    //deze methode kijkt over een key is losgelaten en zet dan de corresponderende variable op false
    void checkKeyReleased(){
        //speciale keys
        if(key == CODED){
          if (keyCode == LEFT) left = false;
          if (keyCode == RIGHT) right = false;
          if (keyCode == UP) up = false;
          if (keyCode == DOWN) down = false;
            //if (keyCode == VK_F2) saveImage = false;
          }
        //normale keys
        //keyboard
        /*if (key == ' ') space = false;
        if (key == 's') save = false;
        if (key == 'z') saveImage = false;
        if (key == 'a') a = false;
        if (key == 'b') b = false;
        if (key == 'c') c = false;
        if (key == 'd') d = false;
        if (key == 'e') e = false;
        if (key == 'f') f = false;
        if (key == 'g') g = false;
        if (key == 'h') h = false;
        if (key == 'i') i = false;
        if (key == 'j') j = false;
        if (key == 'k') k = false;
        if (key == 'l') l = false;
        if (key == 'm') m = false;
        if (key == 'w') w = false;*/

        //makey makey
        if (key == ' ') space = false;
        if (key == 'w') w = false;
        if (key == 'a') a = false;
        if (key == 's') s = false;
        if (key == 'd') d = false;
        if (key == 'f') f = false;
        if (key == 'g') g = false;

        //deze code overloopt alle begrensde keys en al de ingedrukte toets is losgelaten wordt de input variablr op false gezet.
        for(int i = 0; i < keyList.size();i++){
          if(keyList.get(i).equals(str(key))) input = false;
          if(keyList.get(i).equals("left")) input = false;
          if(keyList.get(i).equals("right")) input = false;
          if(keyList.get(i).equals("up")) input = false;
          if(keyList.get(i).equals("down")) input = false;
          //if(keyList.get(i).equals(str(keyCode))) input = false;
        }
      }

    //deze methode checkt of er een toets van de muis is ingedrukt en zet dan de corresponderende op true
    void checkMousePressed(){
      if(mouseButton == LEFT) mouseLeft = true;
    }

    //deze methode checkt of er een toets van de muis is losgelaten en zet dan de corresponderende op false
    void checkMouseReleased(){
      if(mouseButton == LEFT) mouseLeft = false;

      for(int i = 0; i < keyList.size();i++){
        if(keyList.get(i).equals("mouseLeft")) input = false;
      }
    } 
  }

