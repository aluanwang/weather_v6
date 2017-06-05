class Moon{
  int nums=15; 
  float px;
  float py;
  int count;
  float normalize;

  int name;
  Moon(int name) {
    this.name=name;
    px=width/2;
    py=height/2+random(-60, 60);
    count=0;
    normalize=0;
  }

  void display(int alpha) {
    count=k_count(count, 400);
    normalize=2*abs((float(count)/400)-0.5);

    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].rotate(radians(normalize*4-2));
    pg[name].image(snap[2], width/2, py+(normalize*3), 25, 25);
    pg[name].popMatrix();
  }
}