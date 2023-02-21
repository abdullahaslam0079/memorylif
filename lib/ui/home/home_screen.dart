import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

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
              'Feb 19, 2023',
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
                child: Text(
                  'What amazing did you do today?\nWrite 400 characters.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Style.textColor,
                  ),
                ).addPadding(EdgeInsets.all(widget.dimens.k15)),
              ).onTap(() {
                widget.navigator
                    .pushReplacementNamed(RoutePath.textEditorScreen);
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
                'Time remaining: 2:40:15',
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
        ).addPadding(EdgeInsets.all(widget.dimens.k15)),
      ),
    );
  }
}
