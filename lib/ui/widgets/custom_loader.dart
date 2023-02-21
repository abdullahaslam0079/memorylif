import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/ui/widgets/base_container.dart';


import '../../constant/style.dart';

class FlickrLoader extends StatefulWidget {
  final Color leftDotColor;
  final Color rightDotColor;
  final double size;
  final double? screenHeight;
  final bool overLay;

  const FlickrLoader(
      {Key? key,
      this.leftDotColor = Style.primaryColor,
      this.screenHeight,
      this.rightDotColor = Style.accentColor,
      this.overLay = true,
      this.size = 40})
      : super(key: key);

  @override
  _FlickrLoaderState createState() => _FlickrLoaderState();
}

class _FlickrLoaderState extends State<FlickrLoader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic curves = Curves.ease;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color leftDotColor = widget.leftDotColor;
    final Color rightDotColor = widget.rightDotColor;
    final child = SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              controller: _animationController,
              visibility: _animationController.value <= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              initialOffset: Offset(size / 4, 0),
              finalOffset: Offset(-size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              visibility: _animationController.value <= 0.5,
              controller: _animationController,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
              initialOffset: Offset(size / 4, 0),
              finalOffset: Offset(-size / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
          ],
        ),
      ),
    );
    if (widget.overLay) {
      return Scaffold(
          body: BaseContainer(
              height: context.height,
              width: context.width,
              bodyColor: Colors.black12,
              scroll: false,
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), child: child)),
          backgroundColor: Colors.transparent);
    }
    if (widget.screenHeight != null) {
  return     SizedBox(height: widget.screenHeight!,width: context.width, child: Center(child: child));
    }
    return child;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _BuildDot extends StatelessWidget {
  final double size;
  final Color color;
  final Offset initialOffset;
  final Offset finalOffset;
  final Interval interval;
  final bool visibility;
  final AnimationController controller;

  const _BuildDot({
    Key? key,
    required this.size,
    required this.color,
    required this.initialOffset,
    required this.finalOffset,
    required this.interval,
    required this.visibility,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offset offsetAnimation = Tween<Offset>(
      begin: initialOffset,
      end: finalOffset,
    )
        .animate(
          CurvedAnimation(parent: controller, curve: interval),
        )
        .value;

    return Visibility(
      visible: visibility,
      child: Transform.translate(
        offset: offsetAnimation,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
