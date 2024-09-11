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




function setup() {
  createCanvas(640, 480);
    textSize(15);
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
        text(keypoint.part, keypoint.position.x, keypoint.position.y-10)
      }
    }
      //5 = left shoulder
      //7 = left elbow
      //9 = left wrist
    if(pose.keypoints[9].position.y <pose.keypoints[7].position.y){
        text("your left wrist is above your left elbow", 30,30)
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

function findAngle(shoulder, elbow, wrist){
    let vector1 = createVector(shoulder.x -elbow.x, shoulder.y - elbow.y);
    let vector2 = createVector(wrist.x - elbow.x, wrist.y - elbow.y);
    let cos = (vector1.dot(vector2))/(mag(vector1)*mag(vector2));
    let angle = Math.acos(cos);
    return angle;
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



