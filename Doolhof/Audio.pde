class Audio {

  //fields
  Minim minim;

  //piano
  AudioPlayer player1;
  AudioPlayer player2;
  AudioPlayer player3;
  AudioPlayer player4;
  AudioPlayer player5;
  AudioPlayer player6;
  AudioPlayer player7;
  AudioPlayer player8;
  AudioPlayer player9;
  AudioPlayer player10;
  AudioPlayer player11;
  AudioPlayer player12;

  String sound1 = "sound/C3.mp3";
  String sound2 = "sound/C#3.mp3";
  String sound3 = "sound/D3.mp3";
  String sound4 = "sound/D#3.mp3";
  String sound5 = "sound/E3.mp3";
  String sound6 = "sound/F3.mp3";
  String sound7 = "sound/F#3.mp3";
  String sound8 = "sound/G3.mp3";
  String sound9 = "sound/G#3.mp3";
  String sound10 = "sound/A3.mp3";
  String sound11 = "sound/A#3.mp3";
  String sound12 = "sound/B3.mp3";

  //sfeer muziek
  AudioPlayer playerGameMusic;
  String gameMusic = "audio/song.mp3";

  //andere audio
  AudioPlayer playerButton;
  String button = "audio/button.mp3";
  AudioPlayer playerPoort;
  String poort = "audio/poort-openen.mp3";
  AudioPlayer playerLevelUp;
  String levelup = "audio/level-complete.mp3";

  //constructoren
  //deze constructor laad alle players in
  Audio(Minim minim) {
    this.minim = minim;
    player1 = minim.loadFile(sound1);
    player2 = minim.loadFile(sound2);
    player3 = minim.loadFile(sound3);
    player4 = minim.loadFile(sound4);
    player5 = minim.loadFile(sound5);
    player6 = minim.loadFile(sound6);
    player7 = minim.loadFile(sound7);
    player8 = minim.loadFile(sound8);
    player9 = minim.loadFile(sound9);
    player10 = minim.loadFile(sound10);
    player11 = minim.loadFile(sound11);
    player12 = minim.loadFile(sound12);
    playerGameMusic = minim.loadFile(gameMusic);
    playerButton = minim.loadFile(button);
    playerPoort = minim.loadFile(poort);
    playerLevelUp = minim.loadFile(levelup);
  }

  //methods
  //deze methode speeld sound af via de naam player
  void play(String name) {
    if (name.equals("player1")) player1.play();
    if (name.equals("player2")) player2.play();
    if (name.equals("player3")) player3.play();
    if (name.equals("player4")) player4.play();
    if (name.equals("player5")) player5.play();
    if (name.equals("player6")) player6.play();
    if (name.equals("player7")) player7.play();
    if (name.equals("player8")) player8.play();
    if (name.equals("player9")) player9.play();
    if (name.equals("player10")) player10.play();
    if (name.equals("player11")) player11.play();
    if (name.equals("player12")) player12.play();
    if (name.equals("playerGameMusic")) playerGameMusic.play();
    if (name.equals("playerButton")) playerButton.play();
    if (name.equals("playerPoort")) playerPoort.play();
    if (name.equals("playerLevelUp")) playerLevelUp.play();
  }

  //deze methode stopt de minim
  void stop() {
    minim.stop();
  }

  //deze methode stopt de player via naam en leest de file opnieuw in minim
  void stop(String name) {
    if (name.equals("player1")) {
      player1.close();
      player1 = minim.loadFile(sound1);
    }
    if (name.equals("player2")) {
      player2.close();
      player2 = minim.loadFile(sound2);
    }
    if (name.equals("player3")) {
      player3.close();
      player3 = minim.loadFile(sound3);
    }
    if (name.equals("player4")) {
      player4.close();
      player4 = minim.loadFile(sound4);
    } 
    if (name.equals("player5")) {
      player5.close();
      player5 = minim.loadFile(sound5);
    } 
    if (name.equals("player6")) {
      player6.close();
      player6 = minim.loadFile(sound6);
    } 
    if (name.equals("player7")) {
      player7.close();
      player7 = minim.loadFile(sound7);
    } 
    if (name.equals("player8")) {
      player8.close();
      player8 = minim.loadFile(sound8);
    } 
    if (name.equals("player9")) {
      player9.close();
      player9 = minim.loadFile(sound9);
    } 
    if (name.equals("player10")) {
      player10.close();
      player10 = minim.loadFile(sound10);
    } 
    if (name.equals("player11")) {
      player11.close();
      player11 = minim.loadFile(sound11);
    } 
    if (name.equals("player12")) {
      player12.close();
      player12 = minim.loadFile(sound12);
    }
    if (name.equals("playerGameMusic")) {
      playerGameMusic.close();
      playerGameMusic = minim.loadFile(gameMusic);
    }
  }
}

