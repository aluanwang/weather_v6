class Cloud {
  int nums=8; 
  int[] px=new int[nums];
  float[] py=new float[nums];
  float[] speed=new float[nums];
  float[] ss=new float[nums];
  float[] rr=new float[nums];
  int name;
  int cloudnum;
  float offsetX;
  int count;
  Cloud(int name) {
    this.name=name;
    cloudnum=int(random(2, nums));
    // cloudnum=1;
    for (int i=0; i<nums; i++) {
      px[i]=int(random(0, 100));
      py[i]=random(100, 300);
      ss[i]=random(12, 36);
      speed[i]=(random(200, 600));
      rr[i]=int(random(-40, 40));
    }
  }

  void display(int alpha) {
    pg[name].tint(255, alpha);
    for (int i=0; i<cloudnum; i++) {

      pg[name].pushMatrix();
      px[i]=k_count((px[i]), int(speed[i]));
      count=px[i];
      offsetX=abs((float(count)/speed[i])-0.5)*64;
      pg[name].imageMode(CENTER);
      pg[name].translate( offsetX, py[i]);

      pg[name].image(snap[8], 0, 0, ss[i], ss[i]);
      pg[name].popMatrix();
    }
  }
}