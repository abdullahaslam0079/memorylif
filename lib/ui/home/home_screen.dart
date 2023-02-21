
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/section_horizontal_widget.dart';

class HomeScreen extends BaseStateFullWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: widget.dimens.k20,
            ),
            SectionHorizontalWidget(
              crossAxisAlignment: CrossAxisAlignment.center,
              firstWidget: SizedBox(
                height: 30,
                width: 30,
                child: SvgAssets.openAILogo,
              ).addPadding(const EdgeInsets.only(left: 10)),
              secondWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning, Abdullah',
                    style: context.textTheme.headline6?.copyWith(
                      color: Style.whiteColor,
                    ),
                  ),
                  Text('How can I help you today?',
                    style: context.textTheme.caption?.copyWith(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).addPadding(const EdgeInsets.all(15)),
      ),
    );
  }
}
