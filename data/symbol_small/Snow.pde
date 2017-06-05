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
    nums=15;
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
    for (int i=0; i<nums; i++) {
      normal=pow(1.0-2*abs((py[i]/350)-0.5),0.6);
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