
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';

import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';

class LoginScreen extends BaseStateFullWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: widget.dimens.k20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: SvgAssets.openAILogo,
              ),
            ),
            SizedBox(
              height: widget.dimens.k40,
            ),
            Text(
              'Welcome back',
              style: context.textTheme.headline5?.copyWith(
                color: Style.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),

            SectionTextFieldDecor(
              hintText: 'Email',
              readOnly: true,
            ),
            SectionTextFieldDecor(
              hintText: 'Password',
              obscureText: true,
              suffixIcon: const Icon(
                Icons.visibility,
                color: Style.primaryColor,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            BigBtn(
              child: Text(
                'Continue',
                style: context.textTheme.bodyText1?.copyWith(
                  color: Style.whiteColor,
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dont\'t have an account? ',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.whiteColor,
                  ),
                ),
                Text(
                  'Sign up',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ).onTap(() {
                  widget.navigator
                      .pushNamedAndRemoveUntil(RoutePath.signUpScreen);
                }),
              ],
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
          ],
        ).addPadding(const EdgeInsets.all(15)),
      ),
    );
  }
}
