import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:memorylif/ui/widgets/big_btn.dart';
import 'package:memorylif/ui/widgets/section_text_field_with_decor.dart';
import '../../../../constant/style.dart';

class GetUserInfoDialogView extends BaseStateLessWidget {
  GetUserInfoDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            elevation: 4.0,
            child: SizedBox(
              height: dimens.k230,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            'Information',
                            style: context.textTheme.bodyText1?.copyWith(
                              fontFamily: 'Raleway',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Style.textColor,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.cancel_outlined,
                        color: Style.textColor,
                        size: 16,
                      ).onTap(() {
                        Navigator.pop(context);
                      })
                    ],
                  ),
                  dimens.k30.verticalBoxPadding(),
                  SectionTextFieldDecor(
                    hintText: 'Name',
                  ),
                  dimens.k15.verticalBoxPadding(),
                  BigBtn(
                    onTap: () {},
                    showGradient: false,
                    elevation: 0.0,
                    radius: dimens.k25,
                    child: Text(
                      'Continue',
                      style: context.textTheme.subtitle1?.copyWith(
                        fontFamily: 'Raleway',
                        color: Style.cardColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ).addPadding(EdgeInsets.all(dimens.k20)),
            ),
          ),
        ),
      ),
    );
  }
}
