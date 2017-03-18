void setup() {
  size(640, 360);
  background(102);
}

void draw() {
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);    
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  // The stroke function tells the computer what the colour of the margin of the ellipses would be, accordingly yo the speed. A bigger speed would make
  // the ellipses borders to be more faded. The colour varies between shades of grey and black.                         
  stroke(speed);                 
  ellipse(x, y, speed, speed);  
  // this line tells the computer to draw an ellipse, at the coordinates x, y, which are the coordinates of the mouse. The size of it is basedon the speed variable
  //If the mouse if moving slowly, it draws a small eclipse
  //If the mouse if moving quickly, it draws a large eclipse
}