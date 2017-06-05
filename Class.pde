class pdMetro {

  int limit;
  boolean tgl;
  int time;//本地時間
  int duration;//本地時間
  boolean bang;
  int counter;
  int test;

  pdMetro(int limit) {
    tgl=false;
    bang=false;
    this.limit=limit;
    time=0;
    test=int(random(0, 15));
  }

  void reset() {
    time=millis();
    bang=true;
    counter=0;
    test=int(random(0, 15));
    //print("metro reset ");
  }

  void update() {
    if (tgl==true) {
      duration=workTime-time;
      // println(duration);
      if ((duration)>=limit) {
        reset();
      }
    }
    if (bang==true) {
      counter++;
      if (counter>3) {
        //println("bangwork");
        bang=false;
      }
    }
  }
}

//----------------------------------------------------------

class pdLine {
  boolean bang;
  float duration;
  int time;
  int dd;
  int delay;
  float o;

  pdLine(int delay, float duration) {
    this.delay=delay;
    this.duration=duration;
    time=0;
  }

  void reset() {
    time=millis();
    dd=time+delay;
    bang=true;
  }

  void update() {

    if (bang==true) {
      if (workTime>dd) {
        if (workTime-dd<=duration+delay) {
          o=(float(workTime-dd)/(duration+delay));
        } else {
          bang=false;
          o=1;
        }
      } else {
        o=0;
      }
    }
  }
}


class pdDelay {
  boolean bang;
  int time;
  int dd;
  int delay;
  boolean b;

  pdDelay(int delay) {
    this.delay=delay;
    time=0;
    bang=false;
  }

  void reset() {
    time=millis();
    dd=time+delay;
    bang=true;
    b=false;
  }

  void update() {

    if (bang==true) {
      if (workTime>dd) {
        b=true;
      }
    }
  }
}
