import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

import '../../widgets/section_vertical_widget.dart';

class PaymentConsentFooter extends BaseStateFullWidget {
  PaymentConsentFooter({
    Key? key,
  required  this.saveLaterUseOnChange,
    required this.signConsentOnChange,
  }) : super(key: key);
  ValueChanged<bool?> signConsentOnChange ;
  ValueChanged<bool?> saveLaterUseOnChange ;

  @override
  State<PaymentConsentFooter> createState() => _PaymentConsentFooterState();
}

class _PaymentConsentFooterState extends State<PaymentConsentFooter> {
  bool _saveLater = false ;
  bool _signForm = false ;
  @override
  Widget build(BuildContext context) {
    return SectionVerticalWidget(
      firstWidget: SizedBox(
        height: 30,
        child: ListTileTheme(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.zero,
          child: CheckboxListTile(
            value: _signForm,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (c) {
              widget.signConsentOnChange(c);
              _signForm = c! ;
              setState(() {

              });
            },
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(color: Style.textColor, width: 2),
            contentPadding: EdgeInsets.zero,
            activeColor: Style.textColor,
            checkColor: Colors.white,
            secondary: Text(
              'view_consent_form',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: Style.textColor, decoration: TextDecoration.underline),
            ).addPadding(EdgeInsets.symmetric(vertical: widget.dimens.k8)).onTap(() {
            }),
            title: Text('sign_consent_form',
                style: context.textTheme.bodyMedium?.copyWith(color: Style.primaryColor)),
          ),
        ),
      ),
      gap: 4,
      secondWidget: ListTileTheme(
        horizontalTitleGap: 0,
        child: CheckboxListTile(
          value: _saveLater,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (c) {
            _saveLater = c! ;
            setState(() {

            });
            widget.saveLaterUseOnChange(c);
          },
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(color: Style.textColor, width: 2),
          contentPadding: EdgeInsets.zero,
          activeColor: Style.textColor,
          checkColor: Colors.white,
          title: Text('Save for later use',
              style: context.textTheme.bodyMedium?.copyWith(color: Style.primaryColor)),
        ),
      ),
    );
  }
}
