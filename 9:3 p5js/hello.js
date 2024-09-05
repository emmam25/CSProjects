let mic;

function setup(){
    createCanvas(400,400);
    mic = new p5.AudioIn();
    mic.start();
}
function draw(){
    background(0);
    fill(255);
    text('tap to start', width/2, 20);
}