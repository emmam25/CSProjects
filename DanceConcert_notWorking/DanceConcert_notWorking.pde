ArrayList<particleSystem> systems = new ArrayList<particleSystem>();

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
int n;
float r,b,g;

void setup() {
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  n=0;
  b=0;
  g=0;
  r=0;
}

void draw() {
  n++;
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  //fill(50, 100, 250, 200);
  //noStroke();
  //ellipse(v1.x, v1.y, 20, 20);
  if(n%7==0){
    particleSystem p = new particleSystem(v1.x, v1.y, r, b, g);
    systems.add(p);
  }
  r=v1.x/2;
  b=v1.y/2;


  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
 /* fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20); */
  
  
  for(int i =0; i<systems.size(); i++){
    if(systems.get(i).alive()){systems.get(i).addParticles();}
    systems.get(i).run();
    if(systems.get(i).completelyDead()){
      systems.remove(i);
    }
  }
  
  // Display some info
  int t = tracker.getThreshold();
  fill(0); 
 text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500); 
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
} 