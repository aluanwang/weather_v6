class Flash {
  int nums=15; 
  float[] px=new float[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  float rx, ry, size;
  int name;
  float normal;
  Flash(int name) {
    this.name=name;
    nums=15;
    for (int i=0; i<nums; i++) {
      px[i]=random(5, 28);
      py[i]=random(50, 300);
      ss[i]=random(16, 32);
      speed[i]=int(random(2, 8));
    }
    rx=random(5, 28);
    ry=random(50, 300);
    size=random(16, 50);
  }

  void display(int alpha) {

    //pg[name].tint(255,alpha);
    if (frameCount%50==0) {
      rx=random(5, 28);
      ry=random(50, 300);
      size=random(16, 50);
    }

    pg[name].pushMatrix();
    if (frameCount%100<50) {
      pg[name].image(snap[10], rx, ry, size, size);
    }


    pg[name].tint(255, float(frameCount%30)/30*alpha);

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