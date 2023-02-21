
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';


class GetUserDataScreen extends BaseStateFullWidget {
  GetUserDataScreen({Key? key}) : super(key: key);

  @override
  State<GetUserDataScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<GetUserDataScreen> {
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
              'Tell Us About You',
              style: context.textTheme.headline5?.copyWith(
                color: Style.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            Text(
              'Please note that phone verification is required for signup. Your number will only be used to verify your identity for security purposes.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyText2?.copyWith(
                color: Style.whiteColor,
              ),
            ).addPadding(const EdgeInsets.symmetric(horizontal: 15)),
            SizedBox(
              height: widget.dimens.k20,
            ),
            SectionTextFieldDecor(
              hintText: 'Email',
              readOnly: true,
            ),
            // SectionTextFieldDecor(
            //   hintText: 'Email',
            //   readOnly: true,
            // ),



            SizedBox(
              height: widget.dimens.k20,
            ),
            BigBtn(
              child: Text(
                'Create your account',
                style: context.textTheme.bodyText1?.copyWith(
                  color: Style.whiteColor,
                ),
              ),
              onTap: () {
                widget.navigator
                    .pushNamedAndRemoveUntil(RoutePath.verifyEmailScreen);
              },
            ),
            SizedBox(
              height: widget.dimens.k20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account? ',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.whiteColor,
                  ),
                ),
                Text(
                  'Log in',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Style.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ).onTap(() {
                  widget.navigator
                      .pushNamedAndRemoveUntil(RoutePath.loginScreen);
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
