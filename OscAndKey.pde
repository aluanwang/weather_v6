int tempOscData=100;

void keyPressed() {
  if (key=='r') {
    thread("reReadData");//重新讀取，只讀取之前沒成功的
  } else if (key=='d') {
    thread("randomData");//亂數氣候
  } else if (key=='a') {
    thread("allReRead");//全部重新讀取，本來已讀取的也歸0
  } else if (key=='s') {
    output.flush();//列印控制台數值
    output.close();
  } else if (key=='b') {
    gobal[int(random(Areanum))].t1=true;//亂數進退場
  } else if (key=='t') {
    for (int i=0; i<Areanum; i++) {//關掉過場開關
      gobal[i].m1.tgl= !gobal[i].m1.tgl;
      gobal[i].m1.reset();
    }
  } else if (key=='q') {
    println(" ");
    for (int i=0; i<Areanum; i++) {
      print(gobal[i].realhour+" ");
    }
  }
}


void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/data")==true) {
    if (msg.checkTypetag("i")) {
      tempOscData=msg.get(0).intValue();
    }
  }
}

void oscTrigger() {
  if ( tempOscData==0) {
    thread("reReadData");//重新讀取，只讀取之前沒成功的
  } else if (tempOscData==1) {
    thread("randomData");//亂數氣候
  } else if (tempOscData==2) {
    thread("allReRead");//全部重新讀取，本來已讀取的也歸0
  } else if (tempOscData==3) {
    gobal[int(random(Areanum))].t1=true;//亂數進退場
  } else if (tempOscData==4) {
    for (int i=0; i<Areanum; i++) {//關掉過場開關
      gobal[i].m1.tgl= !gobal[i].m1.tgl;
      gobal[i].m1.reset();
    }
  } else if (tempOscData==5) {
  }
}