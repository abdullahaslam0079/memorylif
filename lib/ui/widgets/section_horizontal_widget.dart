import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:memorylif/constant/constants.dart';
import 'package:memorylif/ui/base/base_widget.dart';


class SectionHorizontalWidget extends BaseStateLessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  final double? gap;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  SectionHorizontalWidget({Key? key, this.gap, required this.firstWidget, required this.secondWidget, this.mainAxisAlignment,this.crossAxisAlignment = CrossAxisAlignment.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double _gap = gap ?? (scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1)))!;
    return Row(
      mainAxisSize: mainAxisAlignment != null && mainAxisAlignment == MainAxisAlignment.spaceBetween ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment!,
      children: [firstWidget, _gap.horizontalBoxPadding(), secondWidget],
    );
  }
}
