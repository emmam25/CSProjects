import processing.sound.*;

Waveform waveform;
int songs = 100; //number of waveform samples you want to be able to read at once
PShape wave;

Amplitude amp;
AudioIn in;

void setup() {
  size(displayWidth, displayHeight);

  in = new AudioIn(this);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
  waveform = new Waveform(this, songs);
  waveform.input(in);
  wave = createShape();
}
void draw() {
  noStroke();
  fill(255, 30);
  rect(0, 0, width, height);
  strokeWeight(5);
  waveform.analyze();

  float b = 0;
  translate(width/2, height/2);
  beginShape();
  for (int c = 1; c<5; c++) {
    noFill();
    for (int i = 0; i < songs; i++) {
      float scale = ((c*songs) + i)*5;
      float theta = map(i, 0, songs, 0, PI*2);
      float r = map(waveform.data[i], -0.2, 1, 0, scale);
      float x = r*cos(theta);
      float y = r*sin(theta);
      stroke(b);
      vertex(x, y);
      b+=1;
    }
  }
  endShape();
}

//different radii
//storing last 20 frames
