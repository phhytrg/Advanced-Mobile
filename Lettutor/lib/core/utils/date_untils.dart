class MyDateUtils{
  static String getHourMinute(DateTime dateTime){
    String hour  = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static bool isMorning(DateTime dateTime){
    return dateTime.hour >= 6 && dateTime.hour < 12;
  }

  static bool isAfternoon(DateTime dateTime){
    return dateTime.hour >= 12 && dateTime.hour < 18;
  }

  static bool isEvening(DateTime dateTime){
    return dateTime.hour >= 18 && dateTime.hour < 24;
  }

  static bool isNight(DateTime dateTime){
    return dateTime.hour >= 0 && dateTime.hour < 6;
  }

  static String getPeriod(int timestamp){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    if(isMorning(dateTime)){
      return 'Morning';
    }else if(isAfternoon(dateTime)){
      return 'Afternoon';
    }else if(isEvening(dateTime)){
      return 'Evening';
    }else if(isNight(dateTime)){
      return 'Night';
    }
    return '';
  }

  static isSameDay(DateTime dateTime1, DateTime dateTime2){
    // print(dateTime1);
    // print(dateTime2);
    return dateTime1.year == dateTime2.year && dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day;
  }
}