import oscP5.*;
import netP5.*;
import processing.sound.*;
import ddf.minim.*;
import processing.video.*;

Movie OculusM;
Movie Theme;
Movie currentMovie;
Movie AlohomoraM;
Movie LeviosaM;

OscP5 oscP5;
NetAddress myRemoteLocation;

//For sound:
Minim minim;
AudioOutput out;
AudioPlayer Oculus;
AudioPlayer Alohomora;
AudioPlayer Wingardium;




public int output;
public int spell = 4;
int inactivecount = 0;

public void settings() {
  fullScreen();
  //size(400,400);
}

void setup() {

  minim = new Minim(this);
  frameRate(25);
  
  OculusM = new Movie(this, "Oculus.mov");
  AlohomoraM = new Movie(this, "Alohomora.mov");
  LeviosaM = new Movie(this, "Leviosa.mov");
  Theme = new Movie(this, "Theme.mov");
  
  currentMovie = Theme;
  
  currentMovie.play();
  currentMovie.jump(0);
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, "0.0.0.0",  12000, OscP5.UDP);
  
  Oculus = minim.loadFile("OculusReparo.mp3");
  Alohomora = minim.loadFile("Alohomora.mp3");
  Wingardium = minim.loadFile("WingardiumLeviosa.mp3");

}

// Recieve OSC messages from Wekinator
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/output_1")==true) {
        spell=1;
        println("1 detected");
 } else if (theOscMessage.checkAddrPattern("/output_2")==true) {
     spell=2;
     println("2 detected");
 } else if (theOscMessage.checkAddrPattern("/output_3")==true) {
     spell=3;
     println("3 detected");
 } else if (theOscMessage.checkAddrPattern("/output_4") == true) {
     spell=4;
     println("4 detected");
 } else {
    println("Unknown OSC message received");
    spell=5;
    }
    
    activateSpell(spell);
  }




void activateSpell(float spell)
{

    if (spell == 1)
  {
    currentMovie.stop();
    currentMovie = OculusM;
    currentMovie.play();
    currentMovie.jump(0);
    //Oculus.play();
    println("Succesfull Oculus");
    //exec("/usr/bin/say", "Oculus Reparo");
    spell = 4;
    delay(5000);
    
  }
  
  else if (spell == 2)
  {
    
    currentMovie.stop();
    currentMovie = AlohomoraM;
    currentMovie.play();
    currentMovie.jump(0);
    //Alohomora.play();
    println("Succesfull Oculus");
    //exec("/usr/bin/say", "Alohomora");
    spell = 4;
    delay(5000);

    
return;
  }
  else if (spell == 3)
  {
    currentMovie.stop();
    currentMovie = LeviosaM;
    currentMovie.play();
    currentMovie.jump(0);
    //Wingardium.play();
    println("Succesfull Wingardium Leviosa");
    //exec("/usr/bin/say", "Wingardium Leviosa");

    delay(80000);
    spell = 4;
   
  
return;

}
   else if (spell == 4) {
     //inactivecount ++;
     //if (inactivecount >= 10) {
  
      currentMovie.stop();
      currentMovie = Theme;
      currentMovie.play();
      currentMovie.jump(0);
      //Oculus.play();
      println("Inactive");
      //exec("/usr/bin/say", "No Spell Caste");

     }
  // }


}


void draw() {
  image(currentMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}
