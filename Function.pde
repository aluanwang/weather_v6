int choicebg(int c) {
  if (c<0) {
    return 0;
  } else if (c>=0 && c<10) {
    return 1;
  } else if (c>=10 && c<20) {
    return 2;
  } else if (c>=20 && c<28) {
    return 3;
  } else {
    return 4;
  }
}

float posAvg(float Width, float num, float index ) {
  return index*(Width/(num+1));
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


void mousePressed() {
  int selprint=((mouseX)/32);
  gobal[selprint].t1=true;
  gobal[selprint].showinfo() ;
  thread("threadTime");
}

void reReadData() {
  cheakAllReadDone=false;
  demoMode=false;
  println(" ");
  println("讀取資料中");
  output.println(" ");
  output.println("讀取資料中");
  for (int i=0; i<Areanum; i++) {
    if (gobal[i].rescan==true) {
      gobal[i].testRead();
    }
    gobal[i].sendData();
    gobal[i].checkdata();
  }
  readtime++;
  println("已讀取:"+realnum+" 已掃描："+readtime+"次");
  output.println("已讀取:"+realnum+" 已掃描："+readtime+"次");
  cheakAllReadDone=true;
}

void randomData() {
  demoMode=true;
  println("隨機運算");
  output.println("隨機運算");
  for (int i=0; i<Areanum; i++) {
    gobal[i].demoSendData();
    gobal[i].checkdata();
  }
}

void allReRead() {
  demoMode=false;
  realnum=0;
  readtime=0;
  cheakAllReadDone=true;
  finalReRead=0;
  finalCheck=0;
  oneshot=false;
  oneshotfinish=false;
  readZoneTime=0;
}

void oneshotread() {
  output.println("開機讀取中..");
  println("開機讀取中..");
  for (int i=0; i<Areanum; i++) {
    gobal[i].testRead();
    gobal[i].sendData();
    gobal[i].checkdata();
  }

  oneshotfinish=true;
  output.println(" ");
  println(" ");
  output.println("開機已讀取:"+realnum);
  println("開機已讀取:"+realnum);
}


void drawUpdateData() {
  if (oneshotfinish==true) {
    if (finalReRead==0) {
      if (readtime<10) {
        if (cheakAllReadDone==true) {
          if (realnum<Areanum) {
            thread("reReadData");
          } else if (realnum ==Areanum) {
            finalReRead=1;
            println("全部讀取成功");
            output.println("全部讀取成功");
          }
        }
      }
    } else if (finalReRead==1) {
      finalCheck ++;

      if (finalCheck>30) {
        finalReRead=2;
        println(" ");
        output.println(" ");
      } else {
        print("-");
        output.print("-");
      }
    } else if (finalReRead==2) {
      println("最後驗證讀取中..");
      output.println("最後驗證讀取中..");
      finalReRead=3;
      thread("reReadData");
    }
  }
}

void threadTime() {
  int selprint=((mouseX)/32);
  gobal[selprint].readTimeData();
}

void allReadTime() {

  gobal[readZoneTime].readTimeData();
  if (gobal[readZoneTime].checkRead==true ) {
    readZoneTime++;
    gobal[readZoneTime].resetZone();
  }

  if (readZoneTime==30) {
    println(" ");
    println("allZoneTime is done");
    output.println(" ");
    output.println("allZoneTime is done");
  }
}