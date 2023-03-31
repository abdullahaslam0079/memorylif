import 'package:fluttertoast/fluttertoast.dart';
import 'package:memorylif/constant/style.dart';
import 'package:flutter/material.dart';

class SectionToast {
  static show(String? msg){
    return Fluttertoast.showToast(
        msg: msg ?? 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Style.backgroundColor,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}