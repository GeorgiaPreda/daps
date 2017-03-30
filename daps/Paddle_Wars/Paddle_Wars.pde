int l = 640; // canvas dimension
int x=200, y=200; //coordinates of the ball
float xV=4, yV=4; // velocity of the ball 
int p1y = 200, p2y = 200, ph = 120; // paddle coordinates and height 
int dy,dx; // variables used to store the difference in orientation after the ball is reflected
int score1,score2; // scores 
int aIs = 5; // the speed of the enemy paddle

/* Setting up the canvas size and colour; the text size. This code runs only once*/
void setup()
{
  size (640,640);
  fill (125,0,0);
  textSize(18); 
}

/*This function is used to reset the position of the ball to the centre of the canvas after one player loses */
void reset()
{
  x = l/2;
  y = l/2;
  xV= - xV;
  yV = 2;
}

/*This function computes the position of the ball after hitting a wall or a paddle
  The change in direction is obtained by using negative velocity of hittin a bouncing point*/
void update()
{
  
   x += xV;
   y += yV;
   if (y < 0 && yV < 0)//If the ball hitted the top wall
     yV = -yV;
   if (y > l && yV > 0) //If the ball hitted the bottom wall
     yV = -yV;
   if (x < 0) //If the ball reaches the left side
   {
     if (y > p1y && y < p1y + ph)//If it hitted the paddle
      { 
        xV = -xV;
        dy = y - (p1y + ph/2);
        yV = dy * 0.3;
      }
      else 
      {
        score2++;
        reset();
      }
   }
   if (x > l) //If the ball reaches the right side
   {
     if (y > p2y && y < p2y + ph) //If it hitted the paddle
      { 
        xV = -xV;
        dy = y - (p2y + ph/2);
        yV = dy * 0.3;
      }
      else 
      {
        score1++;
        reset();
      }
   }
   
   // This is the automated control the opponent's paddle
   if (p2y + ph/2 < y)
   {
     p2y += aIs;
     if (p2y > l - ph) // Make sure the paddle stays on the screen
     p2y = l - ph;
   }
   else 
   {
     p2y -= aIs;
     if (p2y < 0) // Make sure the paddle stays on the screen
     p2y = 0;
   }
 
   
     
   
}
/*The main code which is run endlessly */
void draw()
{
  background (0); // Resets the backgroung 
  update(); // Calls the update function
  rect(0, p1y , 14, ph); // Draws one of the paddle
  rect(l-14, p2y, 14, ph); // Draws one of the paddle
  ellipse(x,y,20,20); // Darws the ball
  text ( "You: "+score1, 110, 50); // Shows the player's score
  text ( "Friendly AI: "+score2, 430, 50); // Shows the AI score
  
}
/*The UP and DOWN keys control the player's paddle */
void keyPressed()
{
  if (keyCode == UP)
    {
      if (p1y > 0)
      p1y -= ph/2;
    }
  if (keyCode == DOWN)
    {
      if (p1y < l)
      p1y += ph/2;
    }
    /* Make sure the paddle stays on the screen */
    if(p1y < 0)
      p1y = 0;
    if (p1y > l - ph)
      p1y = l - ph;
}