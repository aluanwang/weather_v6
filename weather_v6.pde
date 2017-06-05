import codeanticode.syphon.*;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
SyphonServer server;
Area[] gobal;

int workTime;
int p5width;
int realnum=0;
int readtime=0;
int finalReRead=0;
int finalCheck=0;
int Areanum=31;

boolean cheakAllReadDone=true; 
boolean oneshot=false;
boolean oneshotfinish=false;
boolean demoMode=false;
boolean flag;

PGraphics[] pg=new PGraphics[Areanum];
PGraphics canvas;
PrintWriter output;

void settings() {
  pixelDensity(2);
  size(992, 448, P2D); 
  PJOGL.profile=1;
}
void setup() {
  frameRate(25);
  oscP5 = new OscP5(this, 8999);
  gobal=new Area[Areanum];
  orignalSetting();

  for (int i=0; i<Areanum; i++) {
    //gobal[i]=new Area(i, areanum[i]);
    gobal[i]=new Area(i, owmid[i]);
    pg[i] = createGraphics(width/Areanum, height, P2D);
  }
  canvas = createGraphics(32*Areanum, 448, P2D);
  server = new SyphonServer(this, "P5");
}

void draw() {

  background(0);
  nowHour=hour();
  nowMin=nf(minute(), 2);
  workTime=millis();

  if (oneshot==false) {
    oneshot=true;
    thread( "oneshotread" );
  }
  //-----------------------------------------
  canvas.beginDraw();
  for (int i=0; i<Areanum; i++) {
    float xx=posAvg(width, Areanum-1, i);
    gobal[i].display();
    canvas.image(pg[i], xx, 0);
  }
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
  //-----------------------------------------

  oscTrigger();
  drawUpdateData();
}