class Yahoo {
  int id;
  XML xml;
  XML condition ;
  XML location;
  XML astronomy;
  XML lastBuildDate;

  String[] sunrise=new String[2] ;
  String[] sunset=new String[2] ;
  String weather = "";
  String city = "";
  String data=" ";
  String showdata;
  String[] list;
  String showDayNight = "";

  boolean read;
  boolean rescan;
  boolean readdate=false;

  int code = 0;
  int temperature = 0;
  int[] hour;
  int[] am;
  int[] pm;
  int realhour=0;
  int diffhour=0;
  int daynight;
  int woeid ;
  int finalDayNight;
  int finalcode;
  int finalTemperature;
  int demoWeather;
  int demoTemperature;
  int demoDayNight;
  int idtex;
  int w_id;
  int www;
  int c_id;

  float c ;
  float daynight_read_texture;  
  float offset;


  Yahoo() {
  }

  void testRead() {
    String url = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select+*+from+weather.forecast+where+woeid=" + woeid + "+and+u='F'";
    xml = loadXML(url);
    location = xml.getChild("results/channel/yweather:location");
    lastBuildDate = xml.getChild("results/channel/lastBuildDate");
    astronomy= xml.getChild("results/channel/yweather:astronomy");
    if (astronomy==null) {
      sunrise[0]="5:26";
      sunrise[1]="AM";
      sunset[0]="6:36";
      sunset[1]="PM";
    } else {
      sunrise = (split(astronomy.getString("sunrise"), ' '));
      sunset = (split(astronomy.getString("sunset"), ' '));
    }
    condition = xml.getChild("results/channel/item/yweather:condition");

    if (condition == null) {
      read=false;
      rescan=true;
      temperature = int(random(0, 100));
      weather = "Mostly Cloudy";
      code = int(random(0, 48));

      showdata=data;
      print("["+chname[id]+":N]");
      output.print("["+chname[id]+":N]");
    } else {     
      read=true;
      realnum++;
      rescan=false;
      readdata();
      print("["+chname[id]+":Y]");
      output.print("["+chname[id]+":Y]");
    }
    if (condition == null) {
      data="Wed, 10 May 2017 03:01 PM CST";
      readdate=false;
    } else {
      readdate=true;
    }
  }

  void readdata() {

    temperature = condition.getInt("temp");
    weather = condition.getString("text");
    code = condition.getInt("code");
    city = location.getString("city");
    data = lastBuildDate.getContent();

    list=(split(data, ' '));

    hour=int(split(list[4], ':'));
    if (list[5].equals("PM")==true) {
      realhour=hour[0]+12-nowHour;
       
    } else {
      realhour=hour[0]-nowHour;
    }
     


    am=int(split(sunrise[0], ":"));
    pm=int(split(sunset[0], ":"));
    if (list[5].equals("PM")) {
      if (hour[0]==12) { 
        daynight=1;
      } else if (hour[0]>pm[0]) {       
        daynight=0;
      } else if (hour[0]<pm[0]) {     
        daynight=1;
      }
    } else if (list[5].equals("AM")) {
      if (hour[0]==12) {         
        daynight=0;
      } else if (hour[0]>am[0]) {   
        daynight=1;
      } else if (hour[0]<am[0]) {     
        daynight=0;
      }
    }
  }

  void setdaynight() {
    if (readdate==true) {
      showdata=nf(realhour+nowHour, 2)+":"+nowMin+" "+list[5];
      if (list[5].equals("PM")) {
        if (hour[0]==12) { 
          daynight=1;
        } else if (hour[0]>pm[0]) {       
          daynight=0;
        } else if (hour[0]<pm[0]) {     
          daynight=1;
        }
      } else if (list[5].equals("AM")) {
        if (hour[0]==12) {         
          daynight=0;
        } else if (hour[0]>am[0]) {   
          daynight=1;
        } else if (hour[0]<am[0]) {     
          daynight=0;
        }
      }
    }
  }

  void sendData() {
    finalcode=code;
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


    c=((finalTemperature-32)*5/9);  
    idtex=choicebg(int(c));
    offset=daynight_read_texture-(idtex*32);
    c_id=idtex*4;
    www=groupWeather(finalcode);
  }

  void showinfo() {
    output.println(city+":"+" "+ c+"度，當地時間"+hour[0]+list[5]+
      "，日落時間："+pm[0]+"，日出時間："+am[0]+showDayNight);
    println(city+":"+" "+ c+"度，當地時間"+hour[0]+list[5] +
      "，日落時間："+pm[0]+"，日出時間："+am[0]+showDayNight);
  }

  void demoSendData() {
    demoWeather=int(random(0, 47));
    demoTemperature=int(random(14, 95));
    demoDayNight=int(random(0, 2));
    finalcode= demoWeather ;
    finalTemperature =demoTemperature;
    finalDayNight=demoDayNight;
  }
}