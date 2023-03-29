import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:memorylif/application/app_view_model.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/local_data_source/preference/i_pref_helper.dart';
import 'package:memorylif/di/di.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends BaseStateFullWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  IPrefHelper iPrefHelper = inject();
  int? secondsUntilNewDay;
  int _calculateSecondsUntilNewDay() {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    Duration duration = tomorrow.difference(now);
    return duration.inSeconds;
  }


  @override
  void initState() {
    final bookViewModel = context.read<BookViewModel>();
    bookViewModel.openBook();
    secondsUntilNewDay = _calculateSecondsUntilNewDay();
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   setState(() {
    //     secondsUntilNewDay = secondsUntilNewDay! - 1;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int hours = secondsUntilNewDay! ~/ 3600;
    int minutes = (secondsUntilNewDay! % 3600) ~/ 60;
    int seconds = secondsUntilNewDay! % 60;
    String countdown = '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
    final appViewModel = context.watch<AppViewModel>();
    final bookViewModel = context.watch<BookViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
          // 'Hi, ${appViewModel.userData!.name.toString()}',
          'Hi, ${iPrefHelper.retrieveUser()['name']}',
          style: context.textTheme.headlineSmall?.copyWith(
            color: Style.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
          'Hope your day was good.',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Style.textColor,
          ),
        ),
        SizedBox(
          height: widget.dimens.k30,
        ),
        Text(
          DateTime.now().format(Constants.apiDateFormat),
          style: context.textTheme.bodyMedium?.copyWith(
            color: Style.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Style.cardColor,
            ),
            child: bookViewModel.todayContent == null
                ? Text(
                    'What amazing did you do today?\nWrite 400 characters.',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Style.textColor,
                    ),
                  ).addPadding(EdgeInsets.all(widget.dimens.k15))
                : HtmlWidget(
                    bookViewModel.todayContent.toString(),
                    customStylesBuilder: (element) {
                      if (element.classes.contains('foo')) {
                        return {'color': 'red'};
                      }
                      return null;
                    },
                    customWidgetBuilder: (element) {},
                    onErrorBuilder: (context, element, error) =>
                        Text('$element error: $error'),
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const CircularProgressIndicator(),
                    renderMode: RenderMode.column,
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      color: Style.textColor,
                    ),
                  ).addPadding(EdgeInsets.all(widget.dimens.k15)),
          ).onTap(() {
            widget.navigator.pushNamed(RoutePath.textEditorScreen);
          }),
        ),
        SizedBox(
          height: widget.dimens.k30,
        ),
        Center(
          child: Container(
            height: widget.dimens.k50,
            width: widget.dimens.k150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.dimens.k10),
              color: Style.primaryColor,
            ),
            child: Center(
              child: Text(
                'That\'s it',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Style.whiteColor,
                  fontSize: widget.dimens.k16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.dimens.k20,
        ),
        Center(
          child: Text(
            'Time remaining: $countdown',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: widget.dimens.k30,
        ),
      ],
    ).addPadding(EdgeInsets.all(widget.dimens.k15));
  }
}
