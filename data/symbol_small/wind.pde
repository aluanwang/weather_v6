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

    //pg[name].tint(255,alpha);

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