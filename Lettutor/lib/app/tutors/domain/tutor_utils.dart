class TutorUtils{
  static List<String> extractSpecialties(String specialties) {
    List<String> items =  specialties.split(',');
    return items.map((item) {
      String formattedItem = item.replaceAll('-', ' ');
      return formattedItem[0].toUpperCase() + formattedItem.substring(1);
    }).toList();
  }
}