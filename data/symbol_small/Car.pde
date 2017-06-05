class Car {

  float px;
  float py;
  int count;
  float normalize;
  int choice;
  float timeline;

  int name;
  Car(int name) {
    this.name=name;
    count=0;
    normalize=0;

    choice=int(random(0, 4));
    if (choice==0) {
      choice=17;
    } else if (choice==1) {
      choice=19;
    } else if (choice==2) {
      choice=21;
    } else if (choice==3) {
      choice=22;
    }
  }

  void display(int alpha) {
    count=k_count(count, 500);
    if (count<200) {
      timeline=map(easeOutQuart(float(count)/200), 0, 1, -32, 16);
      
    } else if (count>200 &&count<400) {
      timeline=16;
      
    } else if (count>400) {
      timeline=map(easeOutExpo(float(500-count)/100), 0, 1, 50, 16);
      
    }

    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].image(snap[choice], timeline, 420);
    pg[name].popMatrix();
  }
}