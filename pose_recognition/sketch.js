//particles that bounce when they hit part of the pose
//human tetris
//game with human controller


// Copyright (c) 2018 ml5
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

/* ===
ml5 Example
PoseNet example using p5.js
=== */

let video;
let poseNet;
let poses = [];

let muscle;
let forearm;
let upperArm;

function preload(){
    muscle = loadImage("muscle.png");
    forearm = loadImage("muscle1.png");
    upperArm = loadImage("muscle2.png");
}

function setup() {
  createCanvas(640, 480);
    
imageMode(CORNER);
  video = createCapture(VIDEO);
  video.size(width, height);

  // Create a new poseNet method with a single detection
  poseNet = ml5.poseNet(video, modelReady);
  // This sets up an event that fills the global variable "poses"
  // with an array every time new poses are detected
  poseNet.on('pose', function(results) {
    poses = results;
  });
  // Hide the video element, and just show the canvas
  video.hide();
}

function modelReady() {
  select('#status').html('Model Loaded');
}

function draw() {
  image(video, 0, 0, width, height);

  // We can call both functions to draw all keypoints and the skeletons
  drawKeypoints();
  drawSkeleton();
}


//identify particular keypoints in the array?
//what is held in keypoints vs skeleton?



// A function to draw ellipses over the detected keypoints
function drawKeypoints()  {
  // Loop through all the poses detected
  for (let i = 0; i < poses.length; i++) {
    // For each pose detected, loop through all the keypoints
    let pose = poses[i].pose;
    fill(i*100, 100, 200); 
    for (let j = 0; j < pose.keypoints.length; j++) {
      // A keypoint is an object describing a body part (like rightArm or leftShoulder)
      let keypoint = pose.keypoints[j];
      // Only draw an ellipse is the pose probability is bigger than 0.2
      if (keypoint.score > 0.2) {
        noStroke();
        ellipse(keypoint.position.x, keypoint.position.y, 10, 10);
                  textSize(15);
        text(keypoint.part, keypoint.position.x, keypoint.position.y-10)
      }
    }
    let leftShoulder = createVector(pose.keypoints[5].position.x, pose.keypoints[5].position.y);
    let leftElbow = createVector(pose.keypoints[7].position.x, pose.keypoints[7].position.y);
    let leftWrist = createVector(pose.keypoints[9].position.x, pose.keypoints[9].position.y);
      
    textSize(15); 
      
    angleMode(DEGREES);
    // turn each arm into a vector
    let upperArmV= createVector(leftShoulder.x -leftElbow.x, leftShoulder.y - leftElbow.y);
    let foreArmV = createVector(leftWrist.x - leftElbow.x, leftWrist.y - leftElbow.y);
    let angle = foreArmV.angleBetween(upperArmV);
      
    if (angle >60 && angle <120){

        push();
        translate(leftWrist.x-50, leftWrist.y);
        rotate(-foreArmV.angleBetween(createVector(0,-1))); // want angle off of y axis (j vector)
        let scaleFactor = abs(leftElbow.y - leftWrist.y)*1.5;
        image(forearm, 0,0, forearm.width * scaleFactor/forearm.height, scaleFactor);
        pop();
        fill(0);
        text(foreArmV.angleBetween(createVector(0,-1)), width - 30, height -30)
      
        
        push();
        translate(leftElbow.x-50, leftElbow.y);
        rotate(-upperArmV.angleBetween(createVector(-1,0))); // want angle off of x axis (i vector)
        scaleFactor = abs(leftElbow.x - leftShoulder.x)*1.5;
        image(upperArm, 0,0, scaleFactor, upperArm.height * scaleFactor/upperArm.width);
        pop();
    }
      
  }
}

// A function to draw the skeletons
function drawSkeleton() {
  // Loop through all the skeletons detected
  for (let i = 0; i < poses.length; i++) {
    let skeleton = poses[i].skeleton;
      stroke(i*100, 100, 200); 
    // For every skeleton, loop through all body connections
    for (let j = 0; j < skeleton.length; j++) {
      let partA = skeleton[j][0];
      let partB = skeleton[j][1];
      line(partA.position.x, partA.position.y, partB.position.x, partB.position.y);
    }
  }
}


function keyPressed()
{
    console.log("hi");

    if (key == 'f')
    {
        console.log("hello");
        let fs = fullscreen();
        fullscreen(!fs);
    }
}



