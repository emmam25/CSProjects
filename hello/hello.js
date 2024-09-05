let cells;

let cellSize;

let generation;
let ruleSet = [0,1,0,1,1,0,1,0];

function setup() {
  noStroke();
  createCanvas(1500,1000);
  cellSize = 10;
  generation = 0;

  cells = [];
    for (let i = 0; i<1500/cellSize; i++){
        cells[i] =0;
    }
  cells[cells.length/2]=1;
}
function draw() {
  //draw the generation of cells
  for (let i =0; i <cells.length; i++) {
    if (cells[i] == 1) {
      fill(0);
    } else {
      fill (255);
    }
    rect(i*cellSize, generation*cellSize, cellSize, cellSize);
  }
  let nextGen = [];
  for (let i = 1; i <cells.length-1; i++) {
    //call a function to look at the neighborhood and store the result!
    let state = newState(cells [i-1], cells [i], cells [i+1]);
    nextGen[i] = state;
  }

  //assign the cells array to the nextGen array
  cells = nextGen;
  generation ++;
  
  if(generation >height/cellSize){
    //randomize ruleset
    for(let i=0; i <ruleSet.length; i++){
      ruleSet[i] = random([0,1]);
    }
    //reset cells array
    for (let i =0; i <cells.length; i ++){
      cells[i] = 0;
      cells [cells.length/2] =1;
      generation = 0;
    }
  }
}

//function to apply rule set to the neighborhood
function newState(l, c,r) {
  if ((l == 1)&& (c == 1) && (r == 1)){
    return ruleSet[0];
  }else if ((l == 1)&& (c == 1) && (r == 0)){
    return ruleSet[1];
  } else if((l == 1)&& (c == 0) && (r == 1)){
    return ruleSet[2];
  }else if((l == 1)&& (c == 0) && (r == 0)){
    return ruleSet[3];
  }else if((l == 0)&& (c == 1) && (r == 1)){
    return ruleSet[4];
  }else if((l == 0)&& (c == 1) && (r == 0)){
    return ruleSet[5];
  }else if((l == 0)&& (c == 0) && (r == 1)){
    return ruleSet[6];
  }else{
    return ruleSet[7];
  }
  }