

int calculateDifferenceInDays(DateTime date1, DateTime date2) {

  Duration difference = date2.difference(date1);

  int differenceInDays = difference.inDays;

  return differenceInDays;
}