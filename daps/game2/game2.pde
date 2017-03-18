class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();                                        //Pvector is a two dimentional vetor. In our example, we will use the vector in order to represent the tail of the sanke.

  

  boolean eat(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 1) {
      total++;
      return true;
    } else {
      return false;
    }
  }

  void dir(float x, float y) {                                                            //updates direction to the snake
    xspeed = x;
    yspeed = y;
  }

  void death() {                                                                        //clears the tail when the snake hits the wall
    for (int i = 0; i < tail.size(); i++) {                                            //the for loop goes to each cell and clear it;
      PVector pos = tail.get(i);
      float d = dist(x, y, pos.x, pos.y);
      if (d < 1) {
        println("starting over");
        total = 0;
        tail.clear();
      }
    }
  }

  void update() {                                                                     // function that makes the snake move; if we did not have this function, the snake will not move;
    
    if (total > 0) {                                                                  //makes the snake move to the chosen direction; if this if missed, all the cells would look like are part of the snake
      if (total == tail.size() && !tail.isEmpty()) { 
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }

    x = x + xspeed*square_size;
    y = y + yspeed*square_size;

    x = constrain(x, 0, width-square_size);                                                  //Constrains the x and y to be between 0 and width-square_size
    y = constrain(y, 0, height-square_size);
  }

  void show() {      
    fill(255);
    for (PVector v : tail) {                                                                  //shows the tail of the snake
      rect(v.x, v.y, square_size, square_size);
    }
    rect(x, y, square_size, square_size);                                                   //shows the head of the snake
  }
}

void pickLocation() {                                                                //this function is used to generate a random position to the "food" cell
  int cols = width/square_size;
  int rows = height/square_size;
  food = new PVector(floor(random(cols)), floor(random(rows)));                       // a new cell of where the "food" will be is picked randomly
  food.mult(square_size);      
}



Snake s;                                                                           //creates the snake snake
int square_size = 50;                                                               //the size of the box

PVector food;                                                                      //creates the vector of the food

void setup() {
  size(600, 600);
  s = new Snake();
  frameRate(10);
  pickLocation();
}



void draw() {
  background(51);

  if (s.eat(food)) {
    pickLocation();
  }
  s.death();            //check if the snake should die
  s.update();           //contantly updates the movement of the snake
  s.show();             //displays the movement of the snake


  fill(255, 0, 100);
  rect(food.x, food.y, square_size, square_size);
}


void keyPressed() {
  if (keyCode == UP) {
    s.dir(0, -1);
  } else if (keyCode == DOWN) {
    s.dir(0, 1);
  } else if (keyCode == RIGHT) {
    s.dir(1, 0);
  } else if (keyCode == LEFT) {
    s.dir(-1, 0);
  }
}