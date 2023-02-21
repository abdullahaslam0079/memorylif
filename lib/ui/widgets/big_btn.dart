
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

class BigBtn extends BaseStateLessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool showGradient;
  final Color color;
  final double? radius;
  final double? height;
  final double? width;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final bool showArrow;
  BigBtn(
      {required this.onTap,
      Key? key,
      this.showArrow = false,
      required this.child,
      this.padding = EdgeInsets.zero,
      this.borderColor = Colors.transparent,
      this.showGradient = false,
      this.radius,
      this.color = Style.primaryColor,
      this.elevation = 4.0,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? dimens.k5),
            ),
            maximumSize: Size(width ?? context.width, height ?? dimens.k50),
            padding: EdgeInsets.zero,
            elevation: elevation),
        child: Container(
          height: height ?? dimens.k50,
          decoration: showGradient
              ? Style.sectionBoxGradientDecoration(radius: radius ?? dimens.k5)
              : Style.sectionBoxDecoration(
                      color: color, radius: radius ?? dimens.k5)
                  .copyWith(border: Border.all(color: borderColor)),
          child: showArrow
              ? Center(
                  child: Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    child,
                    const Spacer(
                      flex: 1,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: dimens.k8,
                    )
                  ],
                ))
              : Center(child: child),
        ),
      ),
    );
  }
}
