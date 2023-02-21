

import 'package:memorylif/constant/constants.dart';

extension AgeExt on DateTime {
  AgeDuration _age() {
    DateTime birthday = DateTime(year, month, day);
    DateTime today = DateTime.now();
    return Age.dateDifference(fromDate: birthday, toDate: today, includeToDate: false);
  }

  AgeDuration get age => _age();
  bool get isValidAge => age.years >= 18;
}
class AgeDuration {
  int days;
  int months;
  int years;

  AgeDuration({this.days = 0, this.months = 0, this.years = 0});

  @override
  String toString() {
    return 'Years: $years, Months: $months, Days: $days';
  }
}

class Age {

  static bool isLeapYear(int year) => (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  static int daysInMonth(int year, int month) =>
      (month == DateTime.february && isLeapYear(year)) ? 29 : Constants.daysInMonthList[month - 1];
  static AgeDuration dateDifference(
      {required DateTime fromDate, required DateTime toDate, bool includeToDate = false}) {
    DateTime endDate = (includeToDate) ? toDate.add(const Duration(days: 1)) : toDate;

    int years = endDate.year - fromDate.year;
    int months = 0;
    int days = 0;

    if (fromDate.month > endDate.month) {
      years--;
      months = (DateTime.monthsPerYear + endDate.month - fromDate.month);

      if (fromDate.day > endDate.day) {
        months--;
        days = daysInMonth(fromDate.year + years, ((fromDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            endDate.day -
            fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    } else if (endDate.month == fromDate.month) {
      if (fromDate.day > endDate.day) {
        years--;
        months = DateTime.monthsPerYear - 1;
        days = daysInMonth(fromDate.year + years, ((fromDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            endDate.day -
            fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    } else {
      months = (endDate.month - fromDate.month);

      if (fromDate.day > endDate.day) {
        months--;
        days = daysInMonth(fromDate.year + years, (fromDate.month + months)) + endDate.day - fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    }

    return AgeDuration(days: days, months: months, years: years);
  }
}
