//PARAMETRES
//Partie keyboard
boolean stop = false;
boolean move = false;

//Partie musique
import processing.sound.*;

// Oscillator and envelope 
TriOsc triOsc;
Env env; 

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.2;
float releaseTime = 0.2;

// This is an octave in MIDI notes.
int[] midiSequence = { 
  60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72
}; 

// Set the duration between the notes
int duration = 200;
// Set the note trigger
int trigger = 0; 

// An index to count up the notes
int note = 0; 


//Partie visuelle

static final int NUM_LINES = 10;
static final int NUM_LINES2 = 20;

float t;
float t2;


//Parametrage des lignes
float x1(float t){
  return sin(t / 10) * 100 + sin(t / 5) * 20;
}
float y1(float t){
  return cos(t / 10) * 100 + sin(t /5) * 50;
}
float x2(float t){
  return sin(t / 10) * 200;
}
float y2(float t){
  return cos(t / 20) * 200 + cos(t / 12) * 20;
}
float x3(float t2){
  return sin(t2 / 10) * 100 + sin(t2 / 5) * 20;
}
float y3(float t2){
  return cos(t2 / 10) * 100 + sin(t2 /5) * 50;
}
float x4(float t2){
  return cos(t2 / 10) * 200 + 100;
}
float y4(float t2){
  return sin(t2 / 20) * 200;
}

//SETUP
void setup() {
  size(640, 360);
  background(255);

  // Create triangle wave and envelope 
  triOsc = new TriOsc(this);
  env  = new Env(this);
}


//DRAW
void draw() { 
  background(20);
  stroke(255);
  noFill();
  
  //Visuel
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(45,78,200);
   strokeWeight(3);
   ellipse(x1(t + i ), y1(t + i), x2(t + i), y2(t + i)); 
 }
   
  for (int i = 0; i < NUM_LINES2; i++) {
   stroke(124, 50, 67);
   strokeWeight(2);
   ellipse(x3(t2 + i + 100), y3(t2 + i), x4(t2 + i + 100), y4(t2 + i)); 
 }
   if(stop == false) {
    t+=0.5;
    t2+=0.3;
   }
    
    
   //Musique
    // If value of trigger is equal to the computer clock and if not all 
    // notes have been played yet, the next note gets triggered.
  if ((millis() > trigger) && (note<midiSequence.length)) {

    // midiToFreq transforms the MIDI value into a frequency in Hz which we use 
    //to control the triangle oscillator with an amplitute of 0.8
    triOsc.play(midiToFreq(midiSequence[note]), t); //augmente l'amplitude à chaque keypressed mais on peut remmettre 0.8 
    

    // The envelope gets triggered with the oscillator as input and the times and 
    // levels we defined earlier
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);

    // Create the new trigger according to predefined durations and speed
    trigger = millis() + duration;

    // Advance by one note in the midiSequence;
    note++; 

    // Loop the sequence
    if (note == 12) {
      note = 0;
    }
    
    if (move == true) {
     t = t + 10;
     note = 0;//pour remettre la loop à 0 mais ça marche pas!!
    }
  }
} 

// This function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}
//KEYBOARD
void keyPressed() {
   
    if (key == ' ') {
      stop = true;
    }
  
    
  if ((keyCode == RIGHT)) {
    move = true;
  }
  

}