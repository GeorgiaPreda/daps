int xPos;                      //Position of the ball
int speed=1;                   //the speed of the ball
int xDir=1;                    //the direction of the ball
int score=0;                   //the start score
int lives=3;                   //number of lives in the start
boolean lost=false;            //checks if the game is lost or not

void setup()                   //Runs once when program launches
{
  size (400,400);              //creates a box of 400x400 px
  xPos=width/2;                //Potitions the ball in the center of the box
  textSize(15);                 //Sets the size of our text
  fill(125,0,0);               //set the color of the ball and the text
}

void draw()                                      //Loops over and over again
{
  background (0);                                //Black background
  ellipse(xPos, height/2,40,40);                 //Draw the ball inn the center of the box
  xPos=xPos+(speed*xDir);                        //updates the ball's position 
  if (xPos > width-20 || xPos<20)                //checks if the ball hit the wall
          {xDir=-xDir;                          //gives the oposite direction to the ball
 
          }
  text("score = "+score,10,10);                    //Prints the score
  text("lives = "+lives,10,25);                   //Prints the number of lives
  
   if (lives<=0)                                  //Check to see if the game should stop
  {
    textSize(20);                               
    text("Game over", 125,100);
    text("Click to try again",103,125);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(15);
  }

}

void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      //checks if the target was hit or not
  {
    score=score+1;                             //the score is increase
    speed=speed+1;                               //the speed is increased
  }
  else                                           //We missed
  {  lives=lives-1;
  
      if (speed>1)                                 //If speed is greater than 1 decrease the speed
      {
          speed=speed-1;
      }
                              
  }
  if (lost==true)                                //If we lost the game, reset now and start over 
  {
      speed=1;                                     //Reset all variables to initial conditions
      lives=3;
      score=0;
      xPos=width/2;
      xDir=1;
      lost=false;
      loop();      //Begin looping draw function again
  }
  
}