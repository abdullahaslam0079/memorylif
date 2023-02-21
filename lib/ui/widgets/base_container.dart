
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';


class BaseContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorderRadius;
  final bool scroll;
  final DecorationImage? image;
  final Color? bodyColor;
  final ScrollController? controller;
  final double? height;
  final double? width;

  const BaseContainer(
      {Key? key,
      this.showBorderRadius = true,
      required this.child,
      this.height,
      this.width,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.scroll = true,
      this.image,
      this.bodyColor,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)) ,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: showBorderRadius ? const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)) : null,
            image: image,
            color: bodyColor ?? Style.backgroundColor),
        child: RemovePrimaryFocusChild(
            child: scroll
                ? SingleChildScrollView(
                    controller: controller,
                    child: child,
                  )
                : child),
      ),
    );
  }
}

class RemovePrimaryFocusChild extends StatelessWidget {
  final Widget child;
  const RemovePrimaryFocusChild({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child.onTap(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }
}
