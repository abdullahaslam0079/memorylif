import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

class MyProfileScreen extends BaseStateFullWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyProfileScreen> {
  int daysLeftInMonth = 0;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    daysLeftInMonth = DateTime(now.year, now.month + 1, 0).day - now.day;
  }

  @override
  Widget build(BuildContext context) {
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
          height: widget.dimens.k50,
        ),
        Text(
          'Here is your stats',
          style: context.textTheme.headlineSmall?.copyWith(
            color: Style.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: widget.dimens.k20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have\'nt written for 3 days in total.',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            Text(
              'Your record is write of 10 days in a row, keep it up!',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            RichText(
              text: TextSpan(
                text: 'Your ',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Style.textColor,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'March ',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Style.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'chapter ends in ',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Style.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: daysLeftInMonth.twoDigits,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Style.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' days',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Style.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).addPadding(EdgeInsets.only(right: widget.dimens.k40)),
        SizedBox(
          height: widget.dimens.k100,
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You are using premium version',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.textColor,
                  ),
                ),
              ],
            ),
          ),
        ).onTap(() {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                // <-- SEE HERE
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

  Widget bottomSheetWidget() {
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
            'Premium Version',
            style: context.textTheme.headlineSmall?.copyWith(
              color: Style.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: widget.dimens.k20,
          ),
          Text(
            'All your data is store on your phone, it will not alerate your experience but if you uninstall ot lose your phone all your data will be lost.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.textColor,
            ),
          ),
          SizedBox(
            height: widget.dimens.k10,
          ),
          Text(
            'By paying onl;y \$ 19.99 / year all your data will be store on server and you can recover your data anytime if you uninstall the application or lose your phone.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Style.textColor,
            ),
          ),
          const Spacer(),
          Container(
            height: widget.dimens.k50,
            width: context.width,
            decoration: BoxDecoration(
              color: Style.primaryColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Style.cardColor),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Pay Now',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.whiteColor,
                    ),
                  ),
                  Text(
                    '\$ 19.99',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.whiteColor,
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
