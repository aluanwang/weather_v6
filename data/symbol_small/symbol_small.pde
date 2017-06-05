PImage symbol;
PImage[] snap=new PImage[23];
PGraphics[] pg=new PGraphics[1];
Star a1;
Rain a2;
Sun a3;
Moon a4;
Snow a5;
Wind a6;
Cloud a7;
Flash a8;
Ufo a9;
Car a10;
Rocket a11;
void setup() {
  size(32, 448, P2D);
  symbol=loadImage("../orignal.png");
  snap[0]=symbol.get(0, 0, 32, 32);//太陽
  snap[1]=symbol.get(32, 0, 32, 32);//雨
  snap[2]=symbol.get(64, 0, 32, 32);//月亮
  snap[3]=symbol.get(96, 0, 32, 32);//雪
  snap[4]=symbol.get(128, 0, 32, 32);//葉 
  snap[5]=symbol.get(0, 32, 32, 32);//花
  snap[6]=symbol.get(32, 32, 32, 32);//太空梭
  snap[7]=symbol.get(64, 32, 32, 32);//雲1
  snap[8]=symbol.get(96, 32, 32, 32);//雲2
  snap[9]=symbol.get(128, 32, 32, 32);//流星
  snap[10]=symbol.get(0, 64, 32, 32);//閃電
  snap[11]=symbol.get(32, 64, 32, 32);//白線條
  snap[12]=symbol.get(64, 64, 32, 32);//冰
  snap[13]=symbol.get(96, 64, 32, 32);//ufo
  snap[14]=symbol.get(128, 64, 32, 32);//ufo
  snap[15]=symbol.get(0, 96, 64, 32);//彩虹
  snap[16]=symbol.get(64, 96, 32, 32);//熱氣球
  snap[17]=symbol.get(96, 96, 64, 32);//公車
  snap[18]=symbol.get(0, 128, 32, 32);//人
  snap[19]=symbol.get(32, 128, 32, 32);//車1
  snap[20]=symbol.get(64, 128, 32, 32);//飛機
  snap[21]=symbol.get(96, 128, 32, 32);//車2
  snap[22]=symbol.get(128, 128, 32, 32);//車3
  a1=new Star(0);
  a2=new Rain(0);
  a3=new Sun(0);
  a4=new Moon(0);
  a5=new Snow(0);
  a6=new Wind(0);
  a7=new Cloud(0);
  a8=new Flash(0);
  a9=new Ufo(0);
  a10=new Car(0);
  a11=new Rocket(0);
  pg[0] = createGraphics(32, 448, P2D);
  a11.count=0;
  
}


void draw() {
  background(255, 0, 0);

  pg[0].beginDraw();
  pg[0].background(0); 
  a11.display(255);

  pg[0].endDraw();
  image(pg[0], 0, 0, 32, 448);
}

int k_count(int i, int count) {
  int k=i;
  if (k<count) {
    k++;
  } else {
    k=0;
  }
  return k;
}