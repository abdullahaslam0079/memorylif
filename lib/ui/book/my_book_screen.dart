import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

class MyBookScreen extends BaseStateFullWidget {
  MyBookScreen({Key? key}) : super(key: key);

  @override
  State<MyBookScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyBookScreen> {
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
          height: widget.dimens.k30,
        ),
        Text(
          'Year 2023',
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
                chapterNames.length,
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
                          'Chapter $index ${chapterNames[index]}',
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
            ).addPadding(const EdgeInsets.symmetric(horizontal: 5))),
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
}
