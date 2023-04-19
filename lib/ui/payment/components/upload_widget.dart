
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/ui/widgets/section_vertical_widget.dart';

import '../../../constant/Images/svgs.dart';
import '../../../constant/style.dart';

class UoloadWidget extends StatelessWidget {
  const UoloadWidget({
    Key? key,
    this.message = "Choose or Upload File"
  }) : super(key: key);
  final String message ;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(30),
      padding: EdgeInsets.zero,
      color: Style.textColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: Style.splashBackgroundLinearDecoration(opacity: 0.1),
          child: Center(
              child: SectionVerticalWidget(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  firstWidget: SizedBox(height: 30, child: SvgAssets.googleIcon),
                  gap: 12,
                  secondWidget: Text(
                   message,
                    style: context.textTheme.bodyMedium?.copyWith(color: Style.primaryColor),
                  ))),
        ),
      ),
    ).addPadding(
      const EdgeInsets.symmetric(horizontal: 2),
    );
  }
}