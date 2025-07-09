part of core;

String tempsEcoule(String dateString) {
  DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);
  Duration difference = DateTime.now().difference(date);
  if (difference.inSeconds < 60) {
    return "Il y a ${difference.inSeconds} s";
  } else if (difference.inMinutes < 60) {
    return "Il y a ${difference.inMinutes} min";
  } else if (difference.inHours < 24) {
    return "Il y a ${difference.inHours} h";
  } else {
    return "Il y a ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}";
  }
}
