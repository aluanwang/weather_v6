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