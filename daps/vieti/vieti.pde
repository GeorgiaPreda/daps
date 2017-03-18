int xPos;                      //Position of the ball
int speed=1;                   //How fast is it moving?
int xDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?

void setup()                   //Runs once when program launches
{
  size (400,400);              //Sets the size of the windoe
  smooth();
  xPos=width/2;                //Centers our ball
  fill(51,189,255);            //Makes the ball and text blue
  textSize(13);                //Sets the size of our text
}

void draw()                                      //Loops over and over again
{
  background (0);                                //Black background
  ellipse(xPos, height/2,40,40);                 //Draw the ball at the xPos (the ball moves just on the ox axes)
  xPos=xPos+(speed*xDir);                        //Update the ball's position 
  if (xPos > width-20 || xPos<20)                //Did the ball hit the side?
  {
    xDir=-xDir;                                  //If it did reverse the direction
  }
  text("score = "+score,10,10);                  //Print the score on the screen
  text("lives = "+lives,width-80,10);            //Print remaining lives
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(20);                                //Set the size of the text
    text("Click to Restart", 125,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}

void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)       //Did we hit the target?
  {
    score=score+speed;                           //Increase the speed
    speed=speed+1;                               //Increase the Score
  }
  else                                           //We missed
  {
    if (speed<1)                                 //If speed is greater than 1 decrease the speed to make the games easier
    {
        speed=speed-1;
    }
    lives=lives-1;                               //Take away one life
  }
  if (lost==true)                                //If we lost the game, reset now and start over 
  {
    speed=1;                                     //Reset all variables to initial conditions
    lives=5;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}


//What about trying to change the line if (dist(mouseX, mouseY, xPos, 200)<=20)   to  (dist(mouseX, mouseY, xPos, 200)<=2000) ? Congratulations, you just hacked the game! By changing the 
// "20" value, we made the area where we can clik bigger, and now no matter where you click on the screen, you won't lost any lives.