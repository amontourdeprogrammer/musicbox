import processing.sound.*;

//PARAMETRES
// keyboard
boolean stop = false;
int red;
int blue;
int green;
// Oscillator and envelope 
TriOsc triOsc;
Env env; 

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.2;
float releaseTime = 0.2;

// This is an octave in MIDI notes.
int[] midiSequence = {73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83};

// Duration between the notes
int duration = 200;
// Note trigger
int trigger = 0; 

// An index to count up the notes
int note = 0; 

//Visuel

static final int NUM_LINES = 10;
static final int NUM_LINES2 = 20;

float t;
float t2;


//Lignes
float x1(float t) {
  return sin(t / 10) * 100 + sin(t / 5) * 20;
}
float y1(float t) {
  return cos(t / 10) * 100 + sin(t /5) * 50;
}
float x2(float t) {
  return sin(t / 10) * 200;
}
float y2(float t) {
  return cos(t / 20) * 200 + cos(t / 12) * 20;
}
float x3(float t2) {
  return sin(t2 / 10) * 100 + sin(t2 / 5) * 20;
}
float y3(float t2) {
  return cos(t2 / 10) * 100 + sin(t2 /5) * 50;
}
float x4(float t2) {
  return cos(t2 / 10) * 200 + 100;
}
float y4(float t2) {
  return sin(t2 / 20) * 200;
}

void setup() {
  size(640, 360);
  background(255);

  triOsc = new TriOsc(this);
  env  = new Env(this);
}

void draw() { 
  background(red, green, blue);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(255);
    strokeWeight(3);
    ellipse(x1(t + i ), y1(t + i), x2(t + i), y2(t + i)); 
 }
   
  for (int i = 0; i < NUM_LINES2; i++) {
    stroke(160, 160, 160);
    strokeWeight(2);
    ellipse(x3(t2 + i + 100), y3(t2 + i), x4(t2 + i + 100), y4(t2 + i)); 
 }
   if(stop == false) {
    t+=0.5;
    t2+=0.3;
 }
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
}


// This function calculates the respective frequency of a MIDI note
float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0)))*440;
}


//KEYBOARD
void keyPressed() {
  if(key == ' '){
      stop = !stop;
  }
  if(stop == false)
  {
  switch (key) {
    case '0':
      triOsc.play(midiToFreq(midiSequence[0]), 0.8);
      break;
    case '1':
      triOsc.play(midiToFreq(midiSequence[1]), 0.8);
      break;
    case '2':
      triOsc.play(midiToFreq(midiSequence[2]), 0.8);
      break;
    case '3':
      triOsc.play(midiToFreq(midiSequence[3]), 0.8);
      break;
    case '4':
      triOsc.play(midiToFreq(midiSequence[4]), 0.8);
      break;
    case '5':
      triOsc.play(midiToFreq(midiSequence[5]), 0.8);
      break;
    case '6':
      triOsc.play(midiToFreq(midiSequence[6]), 0.8);
      break;
    case '7':
      triOsc.play(midiToFreq(midiSequence[7]), 0.8);
      break;
    case '8':
      triOsc.play(midiToFreq(midiSequence[8]), 0.8);
      break;
    case '9':
      triOsc.play(midiToFreq(midiSequence[9]), 0.8);
      break;
    default:
      red=int(random(255));
      green=int(random(255));
      blue=int(random(255));
      break;
  }
  }
 }