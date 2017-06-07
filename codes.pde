PImage bgs;
PImage gray;
PImage dustimg;
PImage citys;
PImage orignal;
PImage bgtime;
PImage[] bgtimeSnap=new PImage[3];
PImage[] snap=new PImage[23];
PFont myFont;

int nowHour;
String nowMin;

String nowMonth;
String nowDay;



int[] timeDiff={
  0, 0, -12, 1, -1, 0, -6, -15, -11, 0, 
  -6, 4, -6, 0, -5, -5, -12, -15, -13, 0, 
  1, -7, 0, -6, -4, -11, -2, -6, -1, -1, 0};

int[]  areanum={2306179, 2151849, 2459115, 1118370, 1208341, 2151330, 554890, 2487956, 455825, 1105779
  , 2346395, 2351310, 1591691, 20070421, 1939753, 2122265, 395269, 9807, 12590119, 1047862
  , 1132599, 44418, 2165352, 615702, 1940345, 455827, 2295411, 766273, 1047378, 1252431, 2161853};

int[]  owmid={1668341, 1796236, 5106292, 1850147, 1619457, 2038349, 2618425, 3986984, 3451190, 1279945, 
  6453366, 2179537, 3369157, 1808926, 108410, 524901, 3646738, 6173331, 4699066, 1636544, 
  1835848, 2643743, 1819729, 2988507, 292223, 3448439, 1275339, 6359304, 1642911, 1566083, 1795565};
String[] timeZoneName={
  "Asia/Taipei", "Asia/Shanghai", "America/New_York", "Asia/Tokyo", "Asia/Bangkok", "Asia/Taipei", "Europe/Copenhagen", "America/Mazatlan", "America/Maceio", "Asia/Taipei", 
  "Europe/Helsinki", "Pacific/Wallis", "Europe/Helsinki", "Asia/Taipei", "Asia/Riyadh", "Europe/Moscow", "America/Caracas", "America/Vancouver", "America/Toronto", "Asia/Taipei", 
  "Asia/Seoul", "Europe/London", "Asia/Taipei", "Europe/Paris", "Asia/Dubai", "America/Bahia", "Asia/Kolkata", "Europe/Madrid", "Asia/Jakarta", "Asia/Jakarta", "Asia/Taipei"};


String[] encity={"taipei", "Shanghai", "New York", "Tokyo", "Bangkok", "Beijing Shi", "Copenhagen", "San Francisco", "Rio de Janeiro", "Suzhou"
  , "Oslo:", "Wellington", "Cape Town", "Hangzhou", "Riyadh", "Moscow", "Caracas", "Vancouver", "Houston", "Manado"
  , "Seoul", "London", "Hong Kong", "Paris", "Dubai", "Sao Paulo", "Mumbai", "Madrid", "Jakarta", "Thanh pho Ho Chi Minh", "Shenzhen"};

String[] chname={"台北", "上海", "紐約", "東京", "曼谷", "北京", "哥本哈根", "舊金山", "里約", "蘇州"
  , "奧斯陸", "威靈頓", "開普敦", "杭州", "利雅德", "莫斯科", "加拉加斯", "溫哥華", "休斯敦", "馬納多"
  , "首爾", "倫敦", "香港", "巴黎", "杜拜", "聖保羅", "孟買", "馬德里", "雅加達", "胡志明市", "深圳"};

String[] conditionCode={"龍捲風", "熱帶風暴", "颶風", "強雷陣雨", "雷陣雨", "混合雨雪", 
  "混合雨雪", "混合雨雪", "冰凍小雨", "細雨", "凍雨", "陣雨", "陣雨", "飄雪", "陣雪", 
  "吹雪", "下雪", "冰雹", "霰", "多塵", "多霧", "陰霾", "多煙", "大風", "有風", "冷", "多雲", "晴時多雲", "晴時多雲", 
  "晴時多雲", "晴時多雲", "晴朗", "晴朗", "晴朗", "晴朗", "雨和冰雹", "炎熱", "雷陣雨", "零星雷陣雨", //29-38 
  "零星雷陣雨", "零星雷陣雨", "暴雪", "零星陣雪", "暴雪", "多雲", "雷陣雨", "陣雪", "雷陣雨"};//39-47
int groupWeather(int code) {
  int www=code;
  if (www==0 || www==1 || www==2 || www==23 || www==24 || www==25) {
    www=0;
    // 風
  } else if (www==3 || www==4 || www==45 || www==47  || www==37 || www==38 || www==39 || www==40) {
    www=1;
    // 雷
  } else if (www==5 || www==6 || www==7 || www==13 || www==14 || www==15 || www==16 || www==41 || www==42 || www==43 || www==46) {
    www=2;
    // 雪
  } else if (www==8 || www==9 || www==10 || www==11 || www==12  || www==44 || www==45 || www==47) {
    www=3;
    // 雨
  } else if (www==19 ||  www==20 || www==21 || www==22) {
    www=4;
    // 灰塵
  } else if (www==26 || www==27 || www==28 || www==29 || www==30) {
    www=5;
    // 雲
  } else if (www==31 || www==32 || www==33 || www==34 || www==36 ) {
    www=6;
    // 晴朗
  } else if (www==35 || www==17 || www==18) {
    www=7;
    //冰雹
  } else {
    www=8;
  }

  return www;
}

int groupWeather2(int code2) {
  int www=code2;
  if ( www==771 || www==781|| www==900|| www==901|| www==902 || www==905 || www==951 || www==952 || www==953
    || www==954 || www==955 || www==956 || www==957 || www==958 || www==959 || www==960 || www==961 || www==962) {
    www=0;
    // 風
  } else if (www==200 || www==201 || www==202 || www==210  || www==211 || www==212 || www==221 || www==230 || www==231 ||  www==232) {
    www=1;
    // 雷
  } else if (www==600 || www==601 || www==602 || www==611 || www==612 || www==615 || www==616 || www==620 || www==621 || www==622 ) {
    www=2;
    // 雪
  } else if (www==300 || www==301 || www==302 || www==310 || www==311  || www==312 || www==313 || www==314 || www==321 ||
    www==500 || www==501 || www==502 || www==503 || www==504  || www==511 || www==520 || www==521 || www==522 || www==531) {
    www=3;// 雨
  } else if (www==701 ||  www==711 || www==721 || www==731 || www==741 || www==751 || www==761 || www==762 ) {
    www=4;
    // 灰塵
  } else if (www==804 || www==803 || www==802 ) {
    www=5;
    // 雲
  } else if (www==800 ||www==801   ) {
    www=6;
    // 晴朗
  } else if (www==906) {
    www=7;
    //冰雹
  } else {
    www=8;
  }

  return www;
}



void orignalSetting() {
  output = createWriter("concoleLog.txt");
  myFont = createFont("PingFang", 32);
  background(0);
  textSize(32);
  fill(255);
  bgs=loadImage("bg_1.png");
  gray=loadImage("gray.png");
  dustimg=loadImage("dust.png");
  citys=loadImage("city.png");
  orignal=loadImage("data/orignal.png");
  bgtime=loadImage("data/ranbow.png");
  bgtimeSnap[0]=bgtime.get(0, 0, 32, 448);//太陽
  bgtimeSnap[1]=bgtime.get(32, 0, 32, 448);//太陽
  bgtimeSnap[2]=bgtime.get(64, 0, 32, 448);//太陽
  snap[0]=orignal.get(0, 0, 32, 32);//太陽
  snap[1]=orignal.get(32, 0, 32, 32);//雨
  snap[2]=orignal.get(64, 0, 32, 32);//月亮
  snap[3]=orignal.get(96, 0, 32, 32);//雪
  snap[4]=orignal.get(128, 0, 32, 32);//葉 
  snap[5]=orignal.get(0, 32, 32, 32);//花
  snap[6]=orignal.get(32, 32, 32, 32);//太空梭
  snap[7]=orignal.get(64, 32, 32, 32);//雲1
  snap[8]=orignal.get(96, 32, 32, 32);//雲2
  snap[9]=orignal.get(128, 32, 32, 32);//流星
  snap[10]=orignal.get(0, 64, 32, 32);//閃電
  snap[11]=orignal.get(32, 64, 32, 32);//白線條
  snap[12]=orignal.get(64, 64, 32, 32);//冰
  snap[13]=orignal.get(96, 64, 32, 32);//ufo
  snap[14]=orignal.get(128, 64, 32, 32);//ufo
  snap[15]=orignal.get(0, 96, 64, 32);//彩虹
  snap[16]=orignal.get(64, 96, 32, 32);//熱氣球
  snap[17]=orignal.get(96, 96, 64, 32);//公車
  snap[18]=orignal.get(0, 128, 32, 32);//人
  snap[19]=orignal.get(32, 128, 32, 32);//車1
  snap[20]=orignal.get(64, 128, 32, 32);//飛機
  snap[21]=orignal.get(96, 128, 32, 32);//車2
  snap[22]=orignal.get(128, 128, 32, 32);//車3
}