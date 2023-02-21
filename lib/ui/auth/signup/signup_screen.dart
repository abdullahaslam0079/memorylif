import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';

class SignUpScreen extends BaseStateFullWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              'Create your account',
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
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Style.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgAssets.googleIcon
                          .addPadding(EdgeInsets.all(widget.dimens.k5)),
                    ).addPadding(const EdgeInsets.only(
                      right: 10,
                      top: 10,
                      bottom: 10,
                    )),
                    Text(
                      'Continue with Google',
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Style.whiteColor,
                      ),
                    ),
                  ],
                ).addPadding(const EdgeInsets.symmetric(horizontal: 5))).onTap(() {
              widget.navigator
                  .pushReplacementNamed(RoutePath.homeScreen);
            }),
            SizedBox(
              height: widget.dimens.k40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Use free version',
                  style: context.textTheme.bodyText2?.copyWith(
                    color: Style.textColor,
                  ),
                ).addPadding(EdgeInsets.only(right: widget.dimens.k5)),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Style.textColor,
                )
              ],
            ),
          ],
        ).addPadding(EdgeInsets.symmetric(
            horizontal: widget.dimens.k15, vertical: widget.dimens.k30)),
      ),
    );
  }
}
