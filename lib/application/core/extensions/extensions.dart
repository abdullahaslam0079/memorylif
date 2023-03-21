
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension ExtensionNum on num {
  String get twoDigits => toString().padLeft(2, "0");
}

extension ExtensionDuration on Duration {
  String get humanize =>
      "${inDays > 0 ? '${inDays}d ' : ''}${inHours.remainder(24).twoDigits}h:${inMinutes.remainder(60).twoDigits}m:${inSeconds.remainder(60).twoDigits}s";
}

extension StringExtension on String {
  int toInt() => int.parse(this);

  double toFloat() => double.parse(this);
  String capitalize() {
    if(this.trim().isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
    return "";
  }

  String defaultOnEmpty([String defaultValue = ""]) => isEmpty ? defaultValue : this;
}

extension ContextExtension on BuildContext {
  double getHeight([double factor = 1]) {
    // assert(factor != 0);
    return MediaQuery.of(this).size.height * factor;
  }

  double getWidth([double factor = 1]) {
    // assert(factor != 0);
    return MediaQuery.of(this).size.width * factor;
  }

  double get height => getHeight();

  double get width => getWidth();


  TextTheme get textTheme => Theme.of(this).textTheme;

  bool hasPixel() {
    final double pixelPk = MediaQuery.of(this).devicePixelRatio;
    return pixelPk > 2.0;
  }

  double pixel() {
    final double pixelPk = MediaQuery.of(this).devicePixelRatio;
    return pixelPk;
  }
}

extension ClickableExtension on Widget {
  Widget onTap(VoidCallback? action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: action,
      child: this,
    );
  }

  Widget onWillPop(bool pop) {
    return WillPopScope(
        onWillPop: () async {
          return pop;
        },
        child: this);
  }
}

extension AddPadding on Widget {
  Widget addPadding(EdgeInsets edgeInsets) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  /// True if this date is on a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
  int get weekOfYear {
    // Add 3 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = ((ordinalDate - weekday + 10) ~/ 7);

    // If the week number equals zero, it means that the given date belongs to the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, one must check that the date is not actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year, 1, 1).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }
  String format(String format) => DateFormat(format).format(this);

  DateTime findFirstDateOfTheWeek({DateTime? dateTime}) {
    dateTime ??= this ;
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }
  DateTime findLastDateOfTheWeek({DateTime? dateTime}) {
    dateTime ??= this ;
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }



  DateTime lastDayOfMonth() =>
      ((month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1)).subtract(const Duration(days: 1));
}
