import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/local_data_source/preference/i_pref_helper.dart';
import 'package:memorylif/data/local_data_source/preference/pref_helper.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends BaseStateFullWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final IPrefHelper iPrefHelper;

  getPrefHelper() async {
    iPrefHelper = PrefHelper(await SharedPreferences.getInstance());
  }

  @override
  void initState() {
    getPrefHelper();
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => widget.navigator.pushNamedAndRemoveUntil(
            iPrefHelper.retrieveUser() == null
                ? RoutePath.getStartedScreen
                : RoutePath.dashboardScreen));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: widget.dimens.k150,
              width: widget.dimens.k150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          widget.dimens.k20.verticalBoxPadding(),
          Text(
            'MemoryLif',
            style: context.textTheme.headline3?.copyWith(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              color: Style.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
