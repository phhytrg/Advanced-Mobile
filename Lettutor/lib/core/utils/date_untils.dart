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

  static String getShortMonth(int month){
    switch(month){
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      default:
        return 'Dec';
    }
  }

  static String getShortWeekDay(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return 'Sun';
    }
  }

  static String getShortWeekDayMonthYear(DateTime dateTime){
    String weekDay = getShortWeekDay(dateTime);
    String dayMonthYear = getShortDayMonthYear(dateTime);
    return '$weekDay, $dayMonthYear';
  }

  static String getShortDayMonthYear(DateTime dateTime){
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = getShortMonth(dateTime.month);
    String year = dateTime.year.toString();
    return '$day $month $year';
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

  static String getWeekDayMonthYear(DateTime dateTime){
    String weekDay = getWeekDay(dateTime);
    String dayMonthYear = getDayMonthYear(dateTime);
    return '$weekDay, $dayMonthYear';
  }

  static isSameDay(DateTime dateTime1, DateTime dateTime2){
    // print(dateTime1);
    // print(dateTime2);
    return dateTime1.year == dateTime2.year && dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day;
  }

  static String getTimeAgo(DateTime dateTime) {
    Duration duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else if (duration.inSeconds > 0) {
      return '${duration.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

}