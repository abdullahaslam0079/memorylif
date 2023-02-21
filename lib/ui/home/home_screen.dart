import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/section_horizontal_widget.dart';
import 'package:super_editor/super_editor.dart';

class HomeScreen extends BaseStateFullWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarLogoWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: widget.dimens.k10,
            ),
            Text(
              'Hi, Thomas.',
              style: context.textTheme.headline5?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k10,
            ),
            Text(
              'Hope your day was good.',
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.textColor,
              ),
            ),

            SizedBox(
              height: widget.dimens.k30,
            ),
            Text(
              'Feb 19, 2023',
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: widget.dimens.k30,
            ),




          ],
        ).addPadding(EdgeInsets.all(widget.dimens.k15)),
      ),
    );
  }
}
