import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import java.util.*; 
import controlP5.*;
import java.io.BufferedWriter;
import java.io.FileWriter;

Minim minim;
Keyboard keyboard;
Audio audio;
ReadWriteFile file;
Screen screen;
ControlP5 cp5;

String saveFilePath = "file/savefile.txt";

void setup() { 
  initInstance();
}

void initInstance(){
  file = new ReadWriteFile(saveFilePath);
  keyboard = new Keyboard();
  minim = new Minim(this);
  audio = new Audio(minim);
  //audio.play("playerGameMusic");
  cp5 = new ControlP5(this);
  screen = new Screen(file, keyboard, minim, audio, cp5);
  }

  void draw() {
    screen.render();
  }

  void keyPressed() {
    keyboard.checkKeyPressed();
  }

  void keyReleased() {
    keyboard.checkKeyReleased();
  }

  void mousePressed() {
    keyboard.checkMousePressed();
  }

  void mouseReleased() {
   keyboard.checkMouseReleased();
 }

