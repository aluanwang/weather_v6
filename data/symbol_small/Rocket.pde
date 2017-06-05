class Rocket {
  int count;
  int choice;
  float timeline;
  int name;
  float py;
  Rocket(int name) {
    this.name=name;
    py=200;
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=6;
    } else {
      choice=9;
    }
  }

  void reset() {
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=6;
    } else {
      choice=9;
    }
  }

  void display(int alpha) {
    if (count<500) {
      count++;
    }
    if (count<200) {
      timeline=map((float(count)/200), 1,0, 0, py);
    } 

    pg[name].pushMatrix();

    if (choice==6) {
      pg[name].translate(64, 120);
      pg[name].rotate(radians(45));
      pg[name].translate(0, timeline);
    } else if (choice==9) {
      pg[name].translate(-64, 150);
      pg[name].rotate(radians(225));
      pg[name].translate(0, timeline);
    }

    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].noStroke();
    pg[name].blendMode(BLEND);
    pg[name].image(snap[choice], 0, 0);
    pg[name].popMatrix();
  }
}