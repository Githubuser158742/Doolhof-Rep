import ddf.minim.*;
import java.util.*; 
import controlP5.*;
import java.io.BufferedWriter;
import java.io.FileWriter;

Minim minim;
Keyboard keyboard;
Audio audio;
ReadWriteFile file;
Screen screen;

String saveFilePath = "file/savefile.txt";

void setup() { 
    initInstance();
}

void initInstance(){
    file = new ReadWriteFile(saveFilePath);
    keyboard = new Keyboard();
    minim = new Minim(this);
    audio = new Audio(minim);
    screen = new Screen(file, keyboard, minim, audio);
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

