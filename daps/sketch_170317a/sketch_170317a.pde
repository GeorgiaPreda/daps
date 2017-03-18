
Star[] stars = new Star[1000];                       // We create an array named "stars",
                                                     // which will be filled with 1000 elements made with the Star() class.

float speed;                                         // We create a variable "speed", it'll be used to control the speed of stars.

void setup() {
  size(600, 600);
  for (int i = 0; i < stars.length; i++) {                
    stars[i] = new Star();                           // We fill the array with a for loop bu creating 1000 new Stars
  }
}

void draw() {
  
  speed = map(mouseX, 0, width, 0, 50);               // We link the value of the speed variable to the mouse position.

  background(0);
  translate(width/2, height/2);                      // We shift the entire composition,
                                                     // moving its center from the top left corner to the center of the canvas(in order to allow us to speed when we go to the right side,
                                                     // and to be slower when we go to the left.
  for (int i = 0; i < stars.length; i++) {         
    stars[i].update();                                // We draw each star, running the "update" method to update its position and
    stars[i].show();                                  // The "show" method to show it on the canvas.
  }
}

class Star {                                          // We create a "Star" Class.

  float x;                                            // We create variables to specify the x and y of each star.
  float y;                                             
  float z;                                            // We create "z", a variable we'll use in a formula to modify the stars position.

  float pz;                                            // We create an other variable to store the previous value of the z variable.
                                                       // (the value of the z variable at the previous frame).

  Star() {

    x = random(-width/2, width/2);                     // We placerandom values in the variables( for the size of the stars)
                                                        // note: height and width are the same: the canvas is a square.
    y = random(-height/2, height/2);
                                                      // note: the z value can't exceed the width/2 (and height/2) value,
                                                      // beacuse I'll use "z" as divisor of the "x" and "y",
                                                      // whose values are also between "0" and "width/2".
    z = random(width/2);
                                                      // We set the previous position of "z" in the same position of "z",
                                                      // which it's like to say that the stars are not moving during the first frame.
    pz = z;
  }

  void update() {
                      // In the formula to set the new stars coordinates
                      // We'll divide a value for the "z" value and the outcome will be
                      // the new x-coordinate and y-coordinate of the star.
                      // Which means if I decrease the value of "z" (which is a divisor),
                      // the outcome will be bigger.
                      // Wich means the more the speed value is bigger, the more the "z" decrease,
                      // and the more the x and y coordinates increase.
                      // Note: the "z" value is the first value I updated for the new frame.
    z = z - speed;
                      // When the "z" value equals to 1, we're sure the star have passed the
                      // borders of the canvas,
                      // so we can place it on more time in the canvas, with new x, y and z values.
                      // Note: in this way we also avoid a potential division by 0.
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    // with theese "map", we get the new star positions
    // the division x / z get a number between 0 and a very high number,
    // we map this number (proportionally to a range of 0 - 1), inside a range of 0 - width/2.
    // In this way we are sure the new coordinates "sx" and "sy" move faster at each frame
    // and which they finish their travel outside of the canvas (they finish when "z" is less than a).

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    // I use the z value to increase the star size between a range from 0 to 16.
    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);

    // Here i use the "pz" valute to get the previous position of the stars,
    // so I can draw a line from the previous position to the new (current) one.
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    // Placing here this line of code, I'm sure the "pz" value are updated after the
    // coordinates are already calculated; in this way the "pz" value is always equals
    // to the "z" value of the previous frame.
    pz = z;

    stroke(255);
    line(px, py, sx, sy);

  }
}