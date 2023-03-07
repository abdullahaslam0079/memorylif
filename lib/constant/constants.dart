import 'package:flutter/material.dart';

extension SizeExt on double {
  SizedBox verticalBoxPadding() => SizedBox(height: this);
  SizedBox horizontalBoxPadding() => SizedBox(width: this);
}

class Px {
  final double kDefaultDuration = .25;
  static const toolBar = 80.0;
  final defaultRadius = 20.0;
  double get statusBarSize => 30;
  double get extendSizeBodyBehindAppBar => toolBar + statusBarSize;
  final kDefault = 0.0;
  final k2 = 2.0;
  final k3 = 3.0;
  final k4 = 4.0;
  final k5 = 5.0;
  final k6 = 6.0;
  final k7 = 7.0;
  final k8 = 8.0;
  final k10 = 10.0;
  final k12 = 12.0;
  final k14 = 14.0;
  final k15 = 15.0;
  final k16 = 16.0;
  final k18 = 18.0;
  final k20 = 20.0;
  final k22 = 22.0;
  final k25 = 25.0;
  final k28 = 28.0;
  final k30 = 30.0;
  final k35 = 35.0;
  final k36 = 36.0;
  final k40 = 40.0;
  final k45 = 45.0;
  final k47 = 47.0;
  final k50 = 50.0;
  final k55 = 55.0;
  final k56 = 56.0;
  final k60 = 60.0;
  final k70 = 70.0;
  final k75 = 75.0;
  final k80 = 80.0;
  final k85 = 85.0;
  final k90 = 90.0;
  final k100 = 100.0;
  final k200 = 200.0;
  final k110 = 110.0;
  final k115 = 115.0;
  final k130 = 130.0;
  final k140 = 140.0;
  final k150 = 150.0;
  final k160 = 160.0;
  final k170 = 170.0;
  final k175 = 175.0;
  final k180 = 180.0;
  final k230 = 230.0;
  final k240 = 240.0;
  final k250 = 250.0;
  final k270 = 270.0;
  final k300 = 300.0;
  final k350 = 350.0;
  final k400 = 400.0;
  final k500 = 500.0;
  final k600 = 600.0;
  final k700 = 700.0;
  double get toolBarHeight => toolBar;
}

class Constants {
  static const notAvailable = 'N/A';
  static String? months(int value) {
    switch (value) {
      case 1:
        return "JANUARY";
      case 2:
        return "FEBRUARY";
      case 3:
        return "MARCH";
      case 4:
        return "APRIL";
      case 5:
        return "MAY";
      case 6:
        return "JUNE";
      case 7:
        return "JULY";
      case 8:
        return "AUGUST";
      case 9:
        return "SEPTEMBER";
      case 10:
        return "OCTOBER";
      case 11:
        return "NOVEMBER";
      case 12:
        return "DECEMBER";
      default:
        return null;
    }
  }

  static int? weekDay(String value) {
    switch (value) {
      case 'Mon':
        return 0;
      case 'Tue':
        return 1;
      case 'Wed':
        return 2;
      case 'Thu':
        return 3;
      case 'Fri':
        return 4;
      case 'Sat':
        return 5;
      case 'Sun':
        return 6;
      default:
        return 0;
    }
  }

  static List<int> daysInMonthList = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
  static const apiDateFormat = "dd-MM-yyyy";
  static const dateMonthYearFormat = "d MMMM, yy";
  static const monYearFormat = "MMM yy";
  static const dateMonthFormat = "MMM d";
  static const dateWeetDateFormat = "EEE d";
  static const weekAndDay = "EEE d";
  static const weekDateMonYear = "EEE, d MMM , yyyy";

  static List<String> genderList = <String>[
    'Male',
    'Female',
    'Other',
    "He/him/his",
    "She/her/hers",
    "They/them",
    "Prefer not to say"
  ];
}
