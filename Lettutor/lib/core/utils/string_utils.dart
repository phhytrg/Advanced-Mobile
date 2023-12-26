class StringUtils {

  static String numberToLevel(int number){
    if(number == 0) {
      return "Any level";
    } else if(number <= 3){
      return "Beginner";
    } else if(number <= 6){
      return "Intermediate";
    } else {
      return "Advanced";
    }
  }
}