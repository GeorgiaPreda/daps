// Example 15-14: "Pointillism"

PImage webImg;
int size_point = 8;

void setup() {
  size(200,200);
   String url = "http://www.color-blindness.com/color-name-hue-tool/js/images/map-red-max.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
  background(255);
  smooth();
}

void draw() {
  
  // Pick a random point from the picture
  int x = int(random(webImg.width));
  int y = int(random(webImg.height));
  int loc = x + y*webImg.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(webImg.pixels[loc]);
  float g = green(webImg.pixels[loc]);
  float b = blue(webImg.pixels[loc]);
  noStroke();
  
  // Back to shapes! Instead of setting a pixel, we use the color 
  // from a pixel to draw a circle.
  fill(r,g,b,100);
  ellipse(x,y,size_point,size_point); 
}