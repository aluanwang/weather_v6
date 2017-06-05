class Ufo {
   
  float px;
  float py;
  int count;
  float normalize;
  int choice;
  float timeline;
  float flash;

  int name;
  Ufo(int name) {
    this.name=name;
    count=0;
    normalize=0;

    choice=int(random(0, 2));
    if (choice==0) {
      choice=13;
    } else {
      choice=14;
    }
  }

  void display(int alpha) {
    count=k_count(count, 500);
    if (count<200) {
      timeline=map(easeOutQuart(float(count)/200), 0, 1, -50, 300);
      flash=0;
    } else if (count>200 &&count<400) {
      timeline=300;
      flash=float(count%25)/25*100+50;
    } else if (count>400) {
      timeline=map(easeOutExpo(float(500-count)/100), 0, 1, -50, 300);
      flash=0;
    }

    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].fill(255, 255, 0, flash);
    pg[name].triangle(width/2, 300, 0, height, width, height);
    pg[name].image(snap[choice], width/2, timeline, 32, 32);
    pg[name].popMatrix();
  }
}