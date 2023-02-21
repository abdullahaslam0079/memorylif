
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';


class GradientProgressBar extends BaseStateLessWidget {
  final double percent;
  final LinearGradient gradient;
  final double height;

  GradientProgressBar({required this.percent, required this.gradient, required this.height ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          width: context.getWidth((percent)),
          duration: const Duration(milliseconds: 600),
          decoration: Style.customGradientBackground(gradient: Style.barGradient, borderRadius: const BorderRadius.all(Radius.circular(999))),
          child:  SizedBox(height: height),
        ),
        Container(
          width: context.width,
          decoration: Style.customGradientBackground(
            gradient: Style.trackGradient,
            borderRadius: const BorderRadius.all(Radius.circular(999)),
          ),
          child:  SizedBox(height: height),
        ),
      ],
    );
  }
}
