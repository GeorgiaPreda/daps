
class Particle {
  float x;
  float y;
  ArrayList<PVector> history;                      //We are going to use a vector that remembers everything that was written on the screen in order to keep displaying what we drawed.

  Particle(float x, float y) {                    //Here we say that each point that we draw has two coordinates : x and y. We will use them to draw lines between the particles
    this.x = x;
    this.y = y;
    this.history = new ArrayList<PVector>();      //We add these two coordinates in out vector
  }

  void update() {
    this.x += random(-10, 10);                    
    this.y += random(-10, 10);                   
    for (PVector v : this.history) {
      v.x += random(-2, 2);                       //We create a new particle with the x coordinate randomly choosed in the neighborhood of our last particle
      v.y += random(-2, 2);                       //We create a new particle with the y coordinate randomly choosed in the neighborhood of our last particle
    }

    PVector v = new PVector(this.x, this.y);       //We create a new particle
    this.history.add(v);                           //We add id
    if (this.history.size() > 100) {
      this.history.remove(0);                      //Each structure has a maximum of particles (this is why they look similar). If we exeed this maximum, we finished our current structure
    }
  }

  void show() {
    stroke(0);
    fill(0, 150);
    ellipse(this.x, this.y, 24, 24);              //We create an elipse at the position of our mouse

    noFill();
    beginShape();
    for (PVector pos : history) {
      //fill(random(255));
      //ellipse(pos.x, pos.y, i, i);
      vertex(pos.x, pos.y);                        //We start drawing vertexes (lines) between our particles on order to link them
    }
    endShape();
  }
}

ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(600, 600);
}

void mousePressed() {
  particles.add(new Particle(mouseX, mouseY));            //We add a new particle when we click the mouse, and this is when we start drawing the structure
}

void draw() {
  background(200);
  for (Particle p : particles) {                          //We add more particles and we draw them
    p.update();
    p.show();
  }
  
}