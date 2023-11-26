class MyDateUtils{
  static String getHourMinute(DateTime dateTime){
    String hour  = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static String getDayMonthYear(DateTime dateTime){
    String day  = dateTime.day.toString().padLeft(2, '0');
    String month = getMonth(dateTime.month);
    String year = dateTime.year.toString();
    return '$day $month $year';
  }

  static String getWeekDay(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }

  static String getMonth(int month){
    switch(month){
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      default:
        return 'December';
    }
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