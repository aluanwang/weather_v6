class Area extends OwMap {
  pdMetro m1;
  pdDelay d1;
  pdLine l0, l1, l2, l3, l4;

  Anims w1Anim;//WEATHER
  Anims s1Anim;//UFO
  Anims s2Anim;//CAR
  int change=1;
  float x;
  float y1;
  float y2;
  float[] aug=new float[15] ;

  boolean showWhat=true;
  boolean t1=true;
  boolean runspecial=true;
  int rand_timebg;
  int radchance=int(random(3000, 4000));//特殊事件發生的機會，越少越快

  //------------------------------------------宣告結束

  Area(int index, int areaCode ) {
    id=index;
    read=false;
    rescan=false;

    if (change==0) {
      www=20;
      woeid=areaCode;
    } else {
      //change
      www=501;
      cityid=areaCode;
    }


    x=posAvg(width, Areanum-1, index);
    y1=posAvg(height, 20, 16);
    y2=posAvg(height, 20, 15.5);

    w_id=int(random(10));
    c_id=idtex*4;
    rand_timebg=int(random(0, 3));

    //-----------宣報不同天候狀況
    daynight_read_texture=0;
    daynight=1;





    //-----------宣告特殊世間時間
    w1Anim=new Anims(id); 
    s1Anim=new Anims(id); 
    s2Anim=new Anims(id);
    s1Anim.b1.count=500;
    s1Anim.b3.count=500;
    s2Anim.b2.count=500;
    s2Anim.b4.count=500;

    //-----------宣告進退場時間
    m1=new pdMetro(80000+(int(random(6))*5000));
    l0=new pdLine(0, 2500);
    l1=new pdLine(300, 1500);
    l2=new pdLine(500, 1000);
    l3=new pdLine(700, 1000);
    l4=new pdLine(100, 1000);
    d1=new pdDelay(10000);
    m1.tgl=true;
    m1.reset();
    for (int i=0; i<15; i++) {
      aug[i]=0;
    }
  }

  void display() {//--------------------------------------開始繪圖

    m1.update();
    l0.update();
    l1.update();
    l2.update();
    l3.update();
    l4.update(); 
    d1.update(); 

    if (m1.bang==true) { 
      t1=true;
    }

    if (t1==true) { //日常退場，時間近
      showWhat= false;
      t1=false;
      l0.reset();
      l1.reset();
      l2.reset();
      l3.reset();
      l4.reset();
      d1.reset();
    }

    if (d1.b==true) {//時間持續三秒
      d1.b=false;
      d1.bang=false;
      showWhat=true;
      l0.reset();
      l1.reset();
      l2.reset();
      l3.reset();
      l4.reset();
    }

    if (showWhat==true) {
      aug[0]=map(easeOutBack(l0.o), 0, 1, 0, 448);
      aug[1]=map(easeOutSine(l2.o), 0, 1, 0, 100);
      aug[2]=map(easeOutBack(l1.o), 0, 1, -100, 20);
      aug[3]=map(easeOutBack(l2.o), 0, 1, 50, y1);
      aug[4]=map(easeOutBack(l3.o), 0, 1, 500, y2);
      aug[5]=map(easeOutBack(l1.o), 0, 1, 0, 255);
      aug[6]=map(easeOutBack(l3.o), 0, 1, 0, 255);
      aug[7]=map(easeOutBack(l4.o), 0, 1, 448, 0);
      aug[8]=map(easeOutBack(l3.o), 0, 1, 180, -260);
    } else {
      aug[0]=map(easeOutBack(l0.o), 1, 0, 0, 448);
      aug[1]=map(easeOutSine(l2.o), 1, 0, 0, 50);
      aug[2]=map(easeOutBack(l1.o), 1, 0, -100, 20);
      aug[3]=map(easeOutBack(l2.o), 1, 0, 50, y1);
      aug[4]=map(easeOutBack(l3.o), 1, 0, 500, y2);
      aug[5]=map(easeOutBack(l1.o), 1, 0, 0, 255);
      aug[6]=map(easeOutBack(l3.o), 1, 0, 0, 255);
      aug[7]=map(easeOutBack(l4.o), 1, 0, 448, 0);
      aug[8]=map(easeOutBack(l3.o), 1, 0, 180, -260);
    }

    pg[id].beginDraw();
    pg[id].textFont(myFont);
    pg[id].background(0);  
    pg[id].tint(255);  

    //--------------------------------------底圖
    pg[id].imageMode(CORNER);
    pg[id].image(bgs, offset, 0, 320, aug[0]);
    pg[id].fill(255, 0, 0);
    pg[id].image(bgtimeSnap[rand_timebg], 0, 0, 32, aug[7]);

    //--------------------------------------城市
    pg[id].tint(255, aug[1]);
    pg[id].blendMode(ADD);
    pg[id].image(citys, id*-32, 0, 992, 448);

    //--------------------------------------下雨天特別黑

    //if (www==3 || www==1 || www==2) {
    pg[id].blendMode(MULTIPLY);
    //pg[id].tint(255,aug[5]);
    pg[id].image(gray, 0, 0);
    // }


    pg[id].blendMode(BLEND);
    if (showWhat==true) { //--------------------------------------各種事件
      if (runspecial==true) {
        int change=int(random(radchance));
        if (change==0) {
          runspecial=false;
          if (finalDayNight==0) {

            int radCh=int(random(2));
            if (radCh==0) {
              s1Anim.b1.reset();//幽浮
              s1Anim.b1.aa=aug[5];
            } else {
              s1Anim.b3.reset();//火箭或隕石
            }
          } else if (finalDayNight==1) {

            int radCh=int(random(2));
            if (radCh==0) {
              s2Anim.b2.reset();//車子
            } else {
              s2Anim.b4.reset();//飛機
            }
          }
        }
      }
    }

    if (read==true) {//---------------------------讀取資料成功
      setdaynight();
      //--------------------------------------各種氣候動畫
      if (finalDayNight==0) {
        w1Anim.star(int(aug[6]));
        s1Anim.ufo(int(aug[6]));
        s1Anim.rocket(int(aug[6]));

        if (s1Anim.b1.count==500 || s1Anim.b3.count==500) {
          runspecial=true;
        }
        if (www==6) {//晴朗的晚上
          w1Anim.moon(int(aug[6]));
        }
      } else if (finalDayNight==1) {
        s2Anim.car(int(aug[6]));
        s2Anim.plain(int(aug[6]));

        if (s2Anim.b2.count==500 || s2Anim.b4.count==500) {
          runspecial=true;
        }

        if (www==6) {//晴朗的白天
          w1Anim.sun(int(aug[6]));
        }
      } 
      if (www==3) {//雨
        w1Anim.rain(int(aug[6]));
      } else if (www==5) {//雲
        w1Anim.cloud(int(aug[6]));
      } else if (www==1) {//雷
        w1Anim.flash(int(aug[6]));
      } else if (www==2) {//雪
        w1Anim.snow(int(aug[6]));
      } else if (www==4) {//灰塵
        w1Anim.dust(int(aug[6]));
      } else if (www==0) {//風
        w1Anim.wind(int(aug[6]));
      } else if (www==7) {//冰
        w1Anim.hail(int(aug[6]));
      } 
      //--------------------------------------溫度Ｃ  
      pg[id].textSize(15);
      pg[id].fill(100); 
      for (int x = -1; x < 2; x++) {
        pg[id].text( int(c) + "°", 5+x, aug[4]);
        pg[id].text( int(c) + "°", 5, aug[4]+x);
      }
      pg[id].fill(255);  
      pg[id].text( int(c) + "°", 5, aug[4]);



      if (change==0) {//--------------------------------------天候狀況 yahoo
        pg[id].textSize(15);
        pg[id].fill(0);  
        for (int x = -1; x < 2; x++) {
          for (int i = 1; i <= conditionCode[code].length(); i++) {
            pg[id].text(conditionCode[code].substring(i-1, i), 10+x, aug[2] + i *18);
          }
          for (int i = 1; i <= conditionCode[code].length(); i++) {
            pg[id].text(conditionCode[code].substring(i-1, i), 10, aug[2] + i *18+x);
          }
        }

        pg[id].fill(255);   

        for (int i = 1; i <= conditionCode[code].length(); i++) {
          pg[id].text(conditionCode[code].substring(i-1, i), 10, aug[2] + i *18);
        }
      } else {//--------------------------------------天候狀況 owmap
        pg[id].textSize(15);
        pg[id].fill(0);  
        for (int x = -1; x < 2; x++) {
          for (int i = 1; i <= weather.length(); i++) {
            pg[id].text(weather.substring(i-1, i), 10+x, aug[2] + i *18);
          }
          for (int i = 1; i <= weather.length(); i++) {
            pg[id].text(weather.substring(i-1, i), 10, aug[2] + i *18+x);
          }
        }

        pg[id].fill(255);   

        for (int i = 1; i <= weather.length(); i++) {
          pg[id].text(weather.substring(i-1, i), 10, aug[2] + i *18);
        }
      }

      //--------------------------------------------------------------現在時間
      pg[id].pushMatrix();
      pg[id].rotate(radians(90));
      pg[id].textSize(14);
      pg[id].fill(50);
      for (int x = -1; x < 2; x++) {
        pg[id].text( showdata, aug[8]+x, -12);
        pg[id].text( showdata, aug[8], -12+x);
      }
      pg[id].fill(255);
      pg[id].text( showdata, aug[8], -12);
      pg[id].popMatrix();
    }//---------------------------------------------------------------------------------讀取資料失敗


    //--------------------------------------地區名字
    pg[id].fill(50);
    pg[id].textSize(15);

    for (int x = -1; x < 2; x++) {
      for (int i = 1; i <= chname[id].length(); i++) {
        pg[id].text(chname[id].substring(i-1, i), 8+x, aug[3] + i *25);
      }
      for (int i = 1; i <= chname[id].length(); i++) {
        pg[id].text(chname[id].substring(i-1, i), 8, aug[3] + i *25+x);
      }
    }

    pg[id].fill(255, 255);
    for (int i = 1; i <= chname[id].length(); i++) {
      pg[id].text(chname[id].substring(i-1, i), 8, aug[3] + i *25);
    }


    //--------------------------------------
    pg[id].strokeWeight(1);
    pg[id].stroke(255, 255-aug[5]);
    pg[id].noFill();
    pg[id].rect(0, 0, 30, 446);
    pg[id].endDraw();
  }
}