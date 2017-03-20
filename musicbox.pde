static final int NUM_LINES = 10;
static final int NUM_LINES2 = 20;


float t;
float t2;


void setup(){
  background(20);
  size(500,500);
}

void draw(){
  background(20);
  stroke(255);
  noFill();
  
  
  translate(width/2, height/2);
  
  for (int i = 0; i < NUM_LINES; i++) {
    stroke(45,78,200);
   strokeWeight(3);
   ellipse(x1(t + i ), y1(t + i), x2(t + i), y2(t + i)); 
 }
    t+=0.5;
    
  for (int i = 0; i < NUM_LINES2; i++) {
   stroke(124, 50, 67);
   strokeWeight(2);
   ellipse(x3(t2 + i + 100), y3(t2 + i), x4(t2 + i + 100), y4(t2 + i)); 
 }
    t2+=0.3;

}

  



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