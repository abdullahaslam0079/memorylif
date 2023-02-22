import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

class CustomBackButton extends BaseStateLessWidget {
  CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.cardColor,
        borderRadius: BorderRadius.circular(dimens.k5),
      ),
      child: Icon(Icons.arrow_back_ios_new, size: dimens.k15, color: Style.textColor)
          .addPadding(EdgeInsets.all(dimens.k5)),
    ).onTap(() {
      navigator.pop();
    }).addPadding(EdgeInsets.all(dimens.k15));
  }
}
