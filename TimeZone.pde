class TimeZone {
  XML xml;
  XML formatted;
  String url;
  int timecityid;
  String timeMonth;
  String timeDay;

  String timeHour;
  String timeMin;
  int timeZoneId;
  boolean checkRead=false;

  TimeZone() {
  }

  void resetZone() {
    boolean checkRead=false;
  }

  void readTimeData() {

    url = "http://api.timezonedb.com/v2/get-time-zone?key=VTB3HPKJK18C&format=xml&by=zone&zone="+timeZoneName[timeZoneId];
    xml = loadXML(url);
    formatted = xml.getChild("formatted");
    String[] timezone=(split(formatted.getContent(), ' '));

    if (formatted == null) {

    } else {
      String[] timezoneDate=(split(timezone[0], '-'));
      String[] timezoneTime=(split(timezone[1], ':'));
      timeMonth=nf(int(timezoneDate[1]), 1);
      timeDay=nf(int(timezoneDate[2]), 1);
      timeHour=nf(int(timezoneTime[0]), 2);
      timeMin=nf(int(timezoneTime[1]), 2);
    }
    print("["+chname[timeZoneId]+"_日期:"+timeMonth+"/"+timeDay+" "+timeHour+":"+timeMin+"]");
    output.print("["+chname[timeZoneId]+"_日期:"+timeMonth+"/"+timeDay+" "+timeHour+":"+timeMin+"]");
    checkRead=true;
  }
}