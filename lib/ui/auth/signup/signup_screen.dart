
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';

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
        child: SingleChildScrollView(
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
                'Create your account',
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
              ),
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
                      .pushReplacementNamed(RoutePath.setPasswordScreen);
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: const Divider(
                          color: Style.whiteColor,
                          height: 50,
                        )),
                  ),
                  Text(
                    "OR",
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Style.whiteColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: const Divider(
                        color: Style.whiteColor,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.dimens.k20,
              ),
              Container(
                  height: widget.dimens.k50,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Style.whiteColor),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgAssets.googleIcon.addPadding(
                          const EdgeInsets.only(right: 15, top: 10, bottom: 10)),
                      Text(
                        'Continue with Google',
                        style: context.textTheme.bodyText1?.copyWith(
                          color: Style.whiteColor,
                        ),
                      ),
                    ],
                  ).addPadding(const EdgeInsets.symmetric(horizontal: 15))),
            ],
          ).addPadding(const EdgeInsets.all(15)),
        ),
      ),
    );
  }
}
