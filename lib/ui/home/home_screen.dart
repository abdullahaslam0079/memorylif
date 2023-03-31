import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:memorylif/application/app_view_model.dart';
import 'package:memorylif/application/book_view_model.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BaseStateFullWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? secondsUntilNewDay;
  int _calculateSecondsUntilNewDay() {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    Duration duration = tomorrow.difference(now);
    return duration.inSeconds;
  }

  bool isLoading = false;
  String? todayContent;

  checkTodayContentData() async {
    BookViewModel bookViewModel = context.read<BookViewModel>();
    if (widget.iPrefHelper.getAppPremiumStatus() == true) {
      setState(() {
        isLoading = true;
      });
      final users = FirebaseFirestore.instance
          .collection('content')
          .doc(widget.iPrefHelper.retrieveUser()['email']);
      final userContent = await users
          .collection(getMonthName(DateTime.now().month))
          .doc(DateTime.now().format(Constants.apiDateFormat))
          .get();
      d('Today Content--- ${userContent.exists}');
      if (userContent.exists) {
        todayContent = userContent.get('content');
        bookViewModel.putContentInBook(
            date: DateTime.now().format(Constants.apiDateFormat),
            textContent: todayContent.toString());
      }
      setState(() {
        isLoading = false;
      });
    } else {
      await bookViewModel.openBook();
      todayContent = bookViewModel.getContentFromBook(
          date: DateTime.now().format(Constants.apiDateFormat));
      setState(() {

      });
    }
  }

  @override
  void initState() {
    secondsUntilNewDay = _calculateSecondsUntilNewDay();
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   setState(() {
    //     secondsUntilNewDay = secondsUntilNewDay! - 1;
    //   });
    // });
    checkTodayContentData();
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
    final bookViewModel = context.watch<BookViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
          'Hi, ${widget.iPrefHelper.retrieveUser()['name']}',
          style: context.textTheme.headlineSmall?.copyWith(
            color: Style.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        RichText(
          text: TextSpan(
            text: 'Have a good ',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.textColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: widget.getDayStatus(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Style.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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
            child: todayContent == null || todayContent!.isEmpty
                ? Text(
                    'What amazing did you do today?\nWrite 400 characters.',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Style.textColor,
                    ),
                  ).addPadding(EdgeInsets.all(widget.dimens.k15))
                : HtmlWidget(
                    todayContent.toString(),
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
