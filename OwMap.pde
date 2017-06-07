class OwMap extends TimeZone {
  int id;
  int cityid;
  int utc;
  XML xml;
  XML weatherXml;
  XML temperatureXml;
  XML location;
  XML sun ;

  String[] sunrise=new String[2] ;
  String[] sunset=new String[2] ;
  String weather = "";
  String city = "";
  String data=" ";
  String showdata;
  String[] list=new String[8];
  String showDayNight = "";
  String rise ;
  String set ;
  String weatherValue ;

  boolean read;
  boolean rescan;
  boolean readdate=false;

  int code2 = 0;
  int code = 0;

  int[] hour;
  int[] am=new int[5];
  int[] pm=new int[5];
  int realhour=0;
  int daynight;
  int woeid ;
  int finalDayNight;
  int finalcode;

  int demoWeather;

  int demoDayNight;
  int idtex;
  int w_id;
  int www;
  int c_id;

  String[] list1;
  String[] list2;
  String[] list3;

  String[] list4;
  String[] list5;
  String[] list6;

  float c ;
  float daynight_read_texture;
  float offset;
  float finalTemperature;
  float temperature = 0;
  float demoTemperature;

  String[] goldkey={"c3117167ff7fb7d604c8d559471322cf", "68e41f712e447f78d000defa30507d4a", "bcb64b3b297f012260ce9e4f1d9fd67b"};
  int radkey;
  OwMap () {
    
  }

  void testRead() {
    radkey=int(random(3));
    String url = "http://api.openweathermap.org/data/2.5/weather?id="+cityid+"&mode=xml&&lang=zh_tw&units=metric&appid="+goldkey[radkey];
    xml = loadXML(url);
    location = xml.getChild("city");
    weatherXml = xml.getChild("weather");
    sun = xml.getChild("city/sun");
    utc=timeDiff[id]+8;

    if (sun==null) {
      sunrise[0]="5:26";
      sunrise[1]="AM";
      sunset[0]="6:36";
      sunset[1]="PM";
      am=int(split(sunrise[0], ":"));
      pm=int(split(sunset[0], ":"));
    } else {
      rise = sun.getString("rise");
      list1=(split(rise, '-'));
      list2=(split(list1[2], 'T'));
      list3=(split(list2[1], ':')); 
      am[0]=abs((int(list3[0])+utc)%24);

      set = sun.getString("set");
      list4=(split(set, '-'));
      list5=(split(list4[2], 'T'));
      list6=(split(list5[1], ':'));
      pm[0]=abs((int(list6[0])+utc)%24);
    }

    if (weatherXml == null) {
      read=false;
      rescan=true;
      temperature = random(0, 40);
      weather = "Mostly Cloudy";
      code2 = 521;

      showdata=data;
      print("["+chname[id]+":N]");
      output.print("["+chname[id]+":N]");
      data="Wed, 10 May 2017 03:01 PM CST";
      readdate=false;
    } else {
      realnum++;
      rescan=false;
      readdata();
      read=true;
      print("["+chname[id]+":Y]");
      output.print("["+chname[id]+":Y]");
      readdate=true;
    }
  }

  void readdata() {
    temperatureXml = xml.getChild("temperature");
    temperature=int(temperatureXml.getFloat("value"));  
    weather =  weatherXml.getString("value");
    code2 = weatherXml.getInt("number");
    city = location.getString("name");
    realhour=(nowHour+timeDiff[id])%24;

    if (realhour>12) {
      list[5]="PM";
    } else {
      list[5]="AM";
    }
  }

  void setdaynight() {
    if (readdate==true) {
      showdata=nf(realhour, 2)+":"+nowMin+" "+list[5];
      if (realhour<pm[0] && realhour>am[0]) {
        daynight=1;
      } else {
        daynight=0;
      }
    }
  }

  void sendData() {
    finalcode=code2;
    finalDayNight=daynight;
    finalTemperature=temperature;
  }

  void checkdata() {

    if (finalDayNight==1) {
      daynight_read_texture=-160;
      showDayNight="，白天";
    } else {
      daynight_read_texture=0;
      showDayNight="，夜晚";
    }
    //-------------------運算
    c=finalTemperature;
    idtex=choicebg(int(c));
    offset=daynight_read_texture-(idtex*32);
    c_id=idtex*4;
    www=groupWeather2(finalcode);
    //println("www:"+www);
  }

  void showinfo() {
    output.println(city+":"+" "+ c+"度，當地時間"+realhour+"，日出："+am[0]+" 日落："+pm[0]+" "+showDayNight);
    print(city+":"+" "+ c+"度，當地時間"+realhour+"，日出："+am[0]+" 日落："+pm[0]+" "+showDayNight);
    //println(sun+",       "+int(list3[0])+","+int(list6[0])+","+utc+","+id+",www"+www);
  }

  void demoSendData() {
    demoWeather=521;
    demoTemperature=random(40);
    demoDayNight=int(random(0, 2));
    finalcode= demoWeather ;
    finalTemperature =demoTemperature;
    finalDayNight=demoDayNight;
  }
}