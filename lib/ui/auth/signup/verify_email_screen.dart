
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/application/main_config/routes/route_path.dart';
import 'package:memorylif/constant/Images/svgs.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_scaffold.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';

class VerifyEmailScreen extends BaseStateFullWidget {
  VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<VerifyEmailScreen> {
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
                'Verify Your email',
                style: context.textTheme.headline5?.copyWith(
                  color: Style.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: widget.dimens.k20,
              ),
              Text(
                'We have sent an OTP to abdullah@gmail.com',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText2?.copyWith(
                  color: Style.whiteColor,
                ),
              ).addPadding(const EdgeInsets.symmetric(horizontal: 15)),
              SizedBox(
                height: widget.dimens.k20,
              ),
              SectionTextFieldDecor(
                hintText: '000 000',
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                  OTPNumberInputFormatter(),
                ],
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
                onTap: () {
                  widget.navigator
                      .pushReplacementNamed(RoutePath.getUserDataScreen);
                },
              ),
              SizedBox(
                height: widget.dimens.k20,
              ),
            ],
          ).addPadding(const EdgeInsets.all(15)),
        ),
      ),
    );
  }
}


class OTPNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}