
class  Anims {
  int id;
  int www;
  Star a1;
  Rain a2;
  Sun a3;
  Moon a4;
  Snow a5;
  Wind a6;
  Cloud a7;
  Flash a8;
  Dust a9;
  Hail a10;
  Ufo b1;
  Car b2;
  Rocket b3;
  Plain b4;


  Anims(int id) {
    this.id=id;
    a1=new Star(id);
    a2=new Rain(id);
    a3=new Sun(id);
    a4=new Moon(id);
    a5=new Snow(id);
    a6=new Wind(id);
    a7=new Cloud(id);
    a8=new Flash(id);
    a9=new Dust(id);
    a10=new Hail(id);
    b1=new Ufo(id);
    b2=new Car(id);
    b3=new Rocket(id);
    b4=new Plain(id);
  }

  void sun(int alpha) {
    a3.display(alpha);
  }
  void moon(int alpha) {
    a4.display(alpha);
  }
  void star(int alpha) {
    a1.display(alpha);
  }
  void rain(int alpha) {
    a2.display(alpha);
  }
  void snow(int alpha) {
    a5.display(alpha);
  }
  void wind(int alpha) {
    a6.display(alpha);
  }
  void cloud(int alpha) {
    a7.display(alpha);
  }
  void flash(int alpha) {
    a8.display(alpha);
  }
  void dust(int alpha) {
    a9.display(alpha);
  }
  void hail(int alpha) {
    a10.display(alpha);
  }
  void ufo(int alpha) {
    b1.display(alpha);
  }
  void car(int alpha) {
    b2.display(alpha);
  }
   void rocket(int alpha) {
    b3.display(alpha);
  }
  void plain(int alpha) {
    b4.display(alpha);
  }
}