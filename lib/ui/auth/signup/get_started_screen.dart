import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class GetStartedScreen extends BaseStateFullWidget {
  GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: widget.dimens.k80,
            ),
            Center(
              child: Container(
                height: widget.dimens.k150,
                width: widget.dimens.k150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpeg'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            const Spacer(),
            Text(
              'Memory Lif',
              style: context.textTheme.headline5?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k10,
            ),
            Text(
              'Please note that Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.textColor,
              ),
            ),
            SizedBox(
              height: widget.dimens.k60,
            ),
            Container(
              height: widget.dimens.k50,
              width: context.width,
              decoration: BoxDecoration(
                color: Style.primaryColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Style.primaryColor),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Get started',
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Style.whiteColor,
                      ),
                    ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Style.whiteColor,
                    )
                  ],
                ),
              ),
            ).onTap(() {
              widget.navigator.pushReplacementNamed(RoutePath.signUpScreen);
            }),
            SizedBox(
              height: widget.dimens.k10,
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
                      'Already have an account?',
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Style.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ).onTap(() {
              widget.navigator.pushReplacementNamed(RoutePath.alreadyHaveAccount);
            }),
          ],
        ).addPadding(EdgeInsets.symmetric(
            horizontal: widget.dimens.k15, vertical: widget.dimens.k30)),
      ),
    );
  }
}
