class Wind {
  int nums=5; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  float[] rr=new float[nums];
  int name;
  float normal;
  float offsetX;
  Wind(int name) {
    this.name=name;
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(8, 20);
      speed[i]=(random(1, 3));
      rr[i]=int(random(-40, 40));
    }
  }

  void display(int alpha) {

    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5), 0.6);
      offsetX=2*abs(((py[i]%80)/80)-0.5)*5;

      if (py[i]<350) {
        py[i]=py[i]+speed[i];
      } else {
        py[i]=-50;
      }

      if (px[i]<36) {
        px[i]=px[i]+speed[i]/3;
      } else {
        px[i]=-4;
      }
      pg[name].pushMatrix();
      pg[name].imageMode(CENTER);
      pg[name].translate( px[i], py[i]);
      pg[name].rotate(radians(px[i])+rr[i]);

      pg[name].tint(255, normal*alpha);
      pg[name].image(snap[4], 0, 0, ss[i], ss[i]);
      pg[name].popMatrix();
    }
  }
}

class Sun {
  int nums=15; 
  float px;
  float py;
  int count;
  float normalize;

  int name;
  Sun(int name) {
    this.name=name;
    px=width/2;
    py=height/2+random(-60, 60);
    count=0;
    normalize=0;
  }

  void display(int alpha) {
    count=k_count(count, 100);
    normalize=2*abs((float(count)/100)-0.5);
    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    //pg[name].image(snap[0], width/2, py+(normalize*3), normalize*20+25, normalize*20+25);
    pg[name].blendMode(BLEND);
    pg[name].image(snap[0], 16, py+(normalize*3), normalize*20+25, normalize*20+25);
    pg[name].popMatrix();
  }
}

class Star {
  int nums=15; 
  float[] sx=new float[nums];
  float[] sy=new float[nums];
  float[] a=new float[nums];
  int name;
  Star(int name) {
    this.name=name;
    nums=int(random(5, 15));
    for (int i=0; i<nums; i++) {
      sx[i]=random(3, 28);
      sy[i]=random(50, 300);
    }
  }

  void display(int alpha) {


    if (frameCount%5==0) {
      for (int i=0; i<nums; i++) {
        int rad=int(random(0, 5));
        if (rad==0) {
          a[i]=random(0, alpha);
        }
      }
    }
    pg[name].pushMatrix();
    for (int i=0; i<nums; i++) {
      pg[name].strokeWeight(2);
      pg[name].stroke(255, a[i]);
      pg[name].point(sx[i], sy[i]);
    }
    pg[name].popMatrix();
  }
}

class Snow {
  int nums=15; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  int name;
  float normal;
  float offsetX;
  Snow(int name) {
    this.name=name;
    nums=int(random(5, 15));
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(8, 20);
      speed[i]=int(random(1, 3));
    }
  }

  void display(int alpha) {

    //pg[name].tint(255,alpha);
    pg[name].pushMatrix();
    pg[name].blendMode(ADD);
    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5), 0.6);
      offsetX=2*abs(((py[i]%80)/80)-0.5)*5;

      if (py[i]<350) {
        py[i]=py[i]+speed[i];
      } else {
        py[i]=-50;
      }
      pg[name].imageMode(CENTER);
      pg[name].tint(255, normal*alpha);
      pg[name].image(snap[3], px[i]+offsetX, py[i], ss[i], ss[i]);
    }
    pg[name].popMatrix();
  }
}

class Rain {
  int nums=15; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  int name;
  float normal;
  Rain(int name) {
    this.name=name;
    nums=int(random(5, 15));
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(16, 32);
      speed[i]=int(random(2, 8));
    }
  }

  void display(int alpha) {
    pg[name].pushMatrix();
    pg[name].blendMode(ADD);
    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5), 0.6);

      if (py[i]<350) {
        py[i]=py[i]+speed[i];
      } else {
        py[i]=-50;
      }
      pg[name].imageMode(CENTER);
      pg[name].tint(255, normal*alpha);
      pg[name].image(snap[1], px[i], py[i], ss[i], ss[i]);
    }
    pg[name].popMatrix();
  }
}
class Moon {
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
    count=int(random(400));
    normalize=0;
  }

  void display(int alpha) {
    count=k_count(count, 400);
    normalize=2*abs((float(count)/400)-0.5);

    pg[name].pushMatrix();
    pg[name].tint(255, alpha);
    pg[name].imageMode(CENTER);
    pg[name].rotate(radians(normalize*4-2));
    pg[name].image(snap[2], 16, py+(normalize*3), 25, 25);
    pg[name].popMatrix();
  }
}

class Cloud {
  int nums=6; 
  int[] numsnap=new int[6];
  int[] px=new int[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  int[] aa=new int[nums];
  int name;
  int cloudnum;
  float offsetX;
  float normal ;
  Cloud(int name) {
    this.name=name;
    cloudnum=int(random(2, nums));
    // cloudnum=1;
    for (int i=0; i<nums; i++) {
      px[i]=int(random(-6, 38));
      py[i]=random(100, 300);
      ss[i]=random(12, 36);
      speed[i]=(random(600, 1000));
      aa[i]=int(random(0, 255));
      numsnap[i]=int(random(2));
    }
  }

  void display(int alpha) {

    for (int i=0; i<cloudnum; i++) {
      pg[name].pushMatrix();
      aa[i]=k_count(aa[i], 255);
      normal=0.2+abs(float(aa[i])/255-0.5)*1.6;
      pg[name].tint(255, alpha*normal);
      pg[name].imageMode(CENTER);
      pg[name].translate( px[i], py[i]);
      if (numsnap[i]==0) {
        pg[name].image(snap[8], 0, 0, ss[i], ss[i]);
      } else {
        pg[name].image(snap[7], 0, 0, ss[i], ss[i]);
      }

      pg[name].popMatrix();
    }
  }
}

class Flash {
  int nums=20; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  float rx, ry, size;
  int name;
  float normal;
  Flash(int name) {
    this.name=name;
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(8, 12);
      speed[i]=int(random(2, 8));
    }
    rx=random(5, 28);
    ry=random(50, 300);
    size=random(16, 50);
  }

  void display(int alpha) {

    if (frameCount%50==0) {
      rx=random(5, 28);
      ry=random(50, 300);
      size=random(16, 32);
    }

    pg[name].pushMatrix();
    pg[name].imageMode(CENTER);
    pg[name].tint(255, float(frameCount%30)/30*alpha);
    pg[name].blendMode(ADD);
    if (frameCount%100<50) {
      pg[name].image(snap[10], int(rx), int(ry), int(size), int(size));
    }


    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5), 0.6);

      if (py[i]<350) {
        py[i]=py[i]+speed[i];
      } else {
        py[i]=-50;
      }

      pg[name].tint(255, normal*alpha);
      pg[name].image(snap[11], px[i], py[i], ss[i], ss[i]);
    }
    pg[name].popMatrix();
  }
}

class Dust {
  int nums=15; 
  float px;
  float py;
  int count;
  float normalize;

  int name;
  Dust(int name) {
    this.name=name;
    px=width/2;
    py=height/2+random(-60, 60);
    count=int(random(500));
    normalize=0;
  }

  void display(int alpha) {
    count=k_count(count, 500);
    normalize=2*abs((float(count)/500)-0.5);
    pg[name].pushMatrix();
    pg[name].imageMode(CORNER);
    pg[name].tint(255, alpha*0.6);
    pg[name].blendMode(ADD);
    pg[name].image(dustimg, normalize*40-80, 0);
    pg[name].blendMode(BLEND);
    pg[name].popMatrix();
  }
}
class Hail {
  int nums=15; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  int name;
  float normal;
  Hail(int name) {
    this.name=name;
    nums=int(random(5, 15));
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(4, 10);
      speed[i]=int(random(2, 8));
    }
  }

  void display(int alpha) {
    pg[name].pushMatrix();
    pg[name].blendMode(ADD);
    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5), 0.6);

      if (py[i]<350) {
        py[i]=py[i]+speed[i];
      } else {
        py[i]=-50;
      }
      pg[name].imageMode(CENTER);
      pg[name].tint(255, normal*alpha);
      pg[name].image(snap[12], px[i], py[i], ss[i], ss[i]);
    }
    pg[name].popMatrix();
  }
}