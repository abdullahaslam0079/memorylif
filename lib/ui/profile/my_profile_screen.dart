import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/dialogs/success_dialog.dart';

class MyProfileScreen extends BaseStateFullWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: widget.dimens.k10,
        ),
        Text(
          'Hi, Thomas.',
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
            Text(
              'Your first chapter ends in 12 days.',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            Text(
              'Your first chapter ends in 12 days.',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
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
              shape: const RoundedRectangleBorder( // <-- SEE HERE
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (context) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[

                    ],
                  ),
                );
              });
        }),
      ],
    ).addPadding(EdgeInsets.all(widget.dimens.k15));
  }
}
