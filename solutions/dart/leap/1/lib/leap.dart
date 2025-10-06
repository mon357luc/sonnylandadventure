class Leap {  
  bool leapYear(int year) {
    int mod_year = year % 400;

    switch (mod_year){
      case 100:
      case 200:
      case 300:
        return false;
    }

    return mod_year % 4 == 0;
  }
}
