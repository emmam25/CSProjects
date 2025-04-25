import processing.sound.*;

Waveform waveform;
int songs = 128;

Amplitude amp;
AudioIn in;

FFT fft;

float[] spectrum;

void setup() {
  size(400, 400);
  in = new AudioIn(this);
  in.start();
  fft = new FFT(this, songs);
  amp = new Amplitude(this);
  amp.input(in);
  waveform = new Waveform(this, songs);
  waveform.input(in);
  fft.input(in);
  spectrum = new float[songs];
}

void draw() {
  background(255);
  fft.analyze(spectrum);

  for (int i = 0; i < songs; i++) {
    strokeWeight(9);
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line(i*9, height, i*9, height - spectrum[i]*height*5 );
  }
}
