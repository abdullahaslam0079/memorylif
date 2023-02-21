
import 'package:flutter/material.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class SplashScreen extends BaseStateFullWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
