
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';
import 'package:memorylif/ui/widgets/base_container.dart';

class BaseScaffoldWithBaseContainer extends BaseStateLessWidget {
  BaseScaffoldWithBaseContainer(
      {Key? key,
      this.appBar,
      required this.body,
      this.bottomNavBar,
      this.scroll,
      this.image,
      this.verticalPadding = false,
      this.boxDecoration,
      this.bodyColor,
      this.padding,
      this.floatingActionButton,
      this.resizeToAvoidBottomInset = false,
      this.controller})
      : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget body;
  final bool? scroll;
  final DecorationImage? image;
  final bool verticalPadding;
  final BoxDecoration? boxDecoration;
  final Color? bodyColor;
  final bool resizeToAvoidBottomInset;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration ?? Style.baseBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavBar,
        appBar: appBar,
        body: BaseContainer(
          padding: padding ??
              EdgeInsets.symmetric(
                  horizontal: dimens.k20,
                  vertical: verticalPadding ? dimens.k5 : dimens.kDefault),
          scroll: scroll ?? true,
          image: image,
          bodyColor: bodyColor,
          controller: controller,
          width: context.width,
          height: context.height,
          child: body,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

class BaseScaffold extends BaseStateLessWidget {
  BaseScaffold(
      {Key? key,
      this.appBar,
      required this.body,
      this.height,
      this.width,
      this.boxDecoration,
      this.bottomNavBar,
      this.floatingActionButtonLocation,
      this.floatingActionButton})
      : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget body;
  final BoxDecoration? boxDecoration;
  final double? height;
  final double? width;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: boxDecoration ?? Style.baseBackground,
      child: Scaffold(
        backgroundColor: Style.backgroundColor,
        appBar: appBar,
        body: body,/*SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: dimens.k400,
                left: -100,
                bottom: dimens.k500,
                top: -100,
                child: Lottie.asset(
                  'assets/lottie/bg_circle_purple.json',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 120,
                bottom: 280,
                left: 220,
                right: -150,
                child: Lottie.asset(
                  'assets/lottie/bg_circle_green.json',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              body,
            ],
          ),
        ),*/
        floatingActionButtonLocation: floatingActionButtonLocation ??
            FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}
