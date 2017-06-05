class Car {
  int count;
  int choice;
  float timeline;
  int name;

  Car(int name) {
    this.name=name;
    count=0;
    choice=int(random(4));
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

  void reset() {
    count=0;
    choice=int(random(4));
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
    if (count<500) {
      count++;
    }

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
    pg[name].blendMode(BLEND);
    pg[name].image(snap[choice], timeline, 440);
    pg[name].popMatrix();
  }
}

class Ufo {
  int count;
  int choice;
  float timeline;
  float flash;
  int name;
  float py;
  float aa;
  Ufo(int name) {
    this.name=name;
    py=random(250, 350);
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=13;
    } else {
      choice=14;
    }
  }

  void reset() {
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=13;
    } else {
      choice=14;
    }
  }

  void display(int alpha) {
    aa=float(alpha);
    if (count<500) {
      count++;
    }
    if (count<200) {
      timeline=map(easeOutQuart(float(count)/200), 0, 1, -50, py);
      flash=0;
    } else if (count>200 &&count<400) {
      timeline=py;
      flash=float(count%25)/25*100+50;
    } else if (count>400) {
      timeline=map(easeOutExpo(float(500-count)/100), 0, 1, -50, py);
      flash=0;
    }

    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].fill(255, 255, 0, flash*(aa/255));
    pg[name].noStroke();
    pg[name].triangle(16, py, 0, height, 32, height);
    pg[name].blendMode(BLEND);
    pg[name].image(snap[choice], 16, timeline);
    pg[name].popMatrix();
  }
}


class Rocket {
  int count;
  int choice;
  float timeline;
  int name;
  float py;
  int offsetY;
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
    offsetY=int(random(50));
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
      timeline=map((float(count)/200), 1, 0, 0, py);
    } 

    pg[name].pushMatrix();

    if (choice==6) {
      pg[name].translate(64, 120+offsetY);
      pg[name].rotate(radians(45));
      pg[name].translate(0, timeline);
    } else if (choice==9) {
      pg[name].translate(-64, 150+offsetY);
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

class Plain {
  int count;
  int choice;
  float timeline;
  float timeline2;
  int name;
  float py;
  int alpha;
  Plain(int name) {
    this.name=name;
    py=random(200, 300);
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=16;
    } else {
      choice=20;
    }
    timeline=425;
    timeline2=-64;
    alpha=0;
  }

  void reset() {
    count=0;
    choice=int(random(2));
    if (choice==0) {
      choice=16;
    } else {
      choice=20;
    }
  }

  void display(int alpha) {
    if (count<500) {
      count++;
    }
    if (count<500) {
      timeline=map(easeInCubic(float(count)/500), 0, 1, 425, -50);
      timeline2=map(easeOutCubic(float(count)/500), 0, 1, -64, 64);
      alpha=count*2;
    } else {
      alpha=0;
    }

    pg[name].pushMatrix();

    if (choice==16) {

      pg[name].translate(16, timeline);
      pg[name].tint(255, 255);
      pg[name].imageMode(CENTER);
      pg[name].noStroke();
      pg[name].blendMode(BLEND);
      if (timeline<423) {
        pg[name].image(snap[choice], 0, 0);
      }
    } else if (choice==20) {  
      pg[name].translate(timeline2, py);
      pg[name].tint(255, 255);
      pg[name].imageMode(CENTER);
      pg[name].noStroke();
      pg[name].blendMode(BLEND);
      pg[name].image(snap[choice], 0, 0);
    }
    pg[name].popMatrix();
  }
}