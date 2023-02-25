import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/app_bar.dart';
import 'package:memorylif/ui/widgets/back_button.dart';
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
      appBar: AppBarLogoWidget(
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: widget.dimens.k20,
            ),
            Text(
              'One last step',
              style: context.textTheme.headline5?.copyWith(
                color: Style.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: widget.dimens.k50,
            ),
            Text(
              'If you paid the premium version and uninstall the application ot lost your phone then no problem, just connect with Google and all your data will be recovered.\n\nIf you didn\'t have premium version then sorry, we cannot recover your data.',
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.textColor,
              ),
            ),

            SizedBox(
              height: widget.dimens.k50,
            ),
            Text(
              'If you paid the premium version and uninstall the application ot lost your phone then no problem, just connect with Google and all your data will be recovered.\n\nIf you didn\'t have premium version then sorry, we cannot recover your data.',
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.textColor,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),

            Row(
              children: <Widget>[
                Icon(
                  Icons.check_box_outlined,
                  color: Style.primaryColor,
                  size: widget.dimens.k20,
                ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
                Text(
                  'I accept Terms and Conditions',
                  style: context.textTheme.bodyText2?.copyWith(
                    color: Style.textColor,
                  ),
                ),
              ],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Use normal app',
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Style.textColor,
                      ),
                    ).addPadding(EdgeInsets.only(right: widget.dimens.k10)),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Style.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: widget.dimens.k10,
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
                    ).addPadding(EdgeInsets.only(
                      right: widget.dimens.k10,
                      top: widget.dimens.k10,
                      bottom: widget.dimens.k10,
                    )),
                    Text(
                      'Continue with Google',
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
                ).addPadding(const EdgeInsets.symmetric(horizontal: 5)))
                .onTap(() {
              widget.navigator.pushReplacementNamed(RoutePath.dashboardScreen);
            }),
          ],
        ).addPadding(EdgeInsets.symmetric(
            horizontal: widget.dimens.k15, vertical: widget.dimens.k30)),
      ),
    );
  }
}
