import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/common/logger/log.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/data/local_data_source/preference/i_pref_helper.dart';
import 'package:memorylif/di/di.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:intl/intl.dart';

class MyBookScreen extends BaseStateFullWidget {
  MyBookScreen({Key? key}) : super(key: key);

  @override
  State<MyBookScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyBookScreen> {
  IPrefHelper iPrefHelper = inject();

  String getMonthName(int monthIndex) {
    DateTime date = DateTime(DateTime.now().year, monthIndex);
    return DateFormat('MMMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    d('Months ${DateTime.now().month}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
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
          'Year ${DateTime.now().year}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Style.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                DateTime.now().month,
                (index) => Container(
                  height: widget.dimens.k40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Style.cardColor,
                    borderRadius: BorderRadius.circular(widget.dimens.k5),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          getMonthName(index+1),
                          // 'Chapter $index ${chapterNames[index]}',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Style.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ).addPadding(EdgeInsets.symmetric(
                            horizontal: widget.dimens.k10)),
                      ],
                    ),
                  ),
                ).addPadding(EdgeInsets.only(bottom: widget.dimens.k5)),
              ),
            ),
          ),
        ),
        Container(
            height: widget.dimens.k50,
            width: context.width,
            decoration: BoxDecoration(
              color: Style.primaryColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Style.primaryColor),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.book,
                  size: widget.dimens.k25,
                  color: Style.cardColor,
                ).addPadding(EdgeInsets.all(
                  widget.dimens.k10,
                )),
                Text(
                  'Pre order your book',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.whiteColor,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$ 19.99/year',
                  style: context.textTheme.caption?.copyWith(
                    color: Style.whiteColor,
                  ),
                ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
              ],
            ).addPadding(const EdgeInsets.symmetric(horizontal: 5))).onTap(() {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder( // <-- SEE HERE
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (context) {
                return bottomSheetWidget();
              });
        }),
      ],
    ).addPadding(EdgeInsets.all(widget.dimens.k15));
  }

  List<String> chapterNames = [
    'The Sad Story',
    'New Journey',
    'A success',
    'Falling Down',
    'Vocations',
    'The Loving Paris',
    'Dedication For Dream'
  ];

  Widget bottomSheetWidget(){
    return SizedBox(
      height: widget.dimens.k350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: widget.dimens.k10,
          ),
          Text(
            'Pre order your book',
            style: context.textTheme.headlineSmall?.copyWith(
              color: Style.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: widget.dimens.k20,
          ),
          Text(
            'If you paid the premium version and uninstall the application ot lost your phone then no problem, just connect with Google and all your data will be recovered.\n\nIf you didn\'t have premium version then sorry, we cannot recover your data.',
            style: context.textTheme.bodyText2?.copyWith(
              color: Style.textColor,
            ),
          ),

          const Spacer(),

          Container(
            height: widget.dimens.k50,
            width: context.width,
            decoration: BoxDecoration(
              color: Style.cardColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Style.cardColor),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Order Now',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.textColor,
                    ),
                  ),
                  Text(
                    '\$ 19.99',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.textColor,
                    ),
                  ),
                ],
              ).addPadding(EdgeInsets.symmetric(horizontal: widget.dimens.k15)),
            ),
          ),

          SizedBox(
            height: widget.dimens.k20,
          ),

        ],
      ).addPadding(EdgeInsets.all(widget.dimens.k15)),
    );
  }


}

