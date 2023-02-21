import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:memorylif/ui/base/base_widget.dart';

enum ArcType { half, full }

enum CircularStrokeCap { butt, round, square }

extension CircularStrokeCapExtension on CircularStrokeCap {
  StrokeCap get strokeCap {
    switch (this) {
      case CircularStrokeCap.butt:
        return StrokeCap.butt;
      case CircularStrokeCap.round:
        return StrokeCap.round;
      case CircularStrokeCap.square:
        return StrokeCap.square;
    }
  }
}

num radians(num deg) => deg * (math.pi / 180.0);

class CustomCircularPercentIndicator extends BaseStateFullWidget {

  final double percent;
  final double radius;
  final double lineWidth;
  final double backgroundWidth;
  final Color fillColor;
  final Color backgroundColor;
  Color get progressColor => _progressColor;
  late Color _progressColor;
  final bool animation;
  final int animationDuration;
  final Widget? header;
  final Widget? footer;
  final Widget? center;
  final LinearGradient? linearGradient;
  final CircularStrokeCap circularStrokeCap;
  final double startAngle;
  final bool animateFromLastPercent;
  final bool addAutomaticKeepAlive;
  final ArcType? arcType;
  final Color? arcBackgroundColor;
  final bool reverse;
  final MaskFilter? maskFilter;
  final Curve curve;
  final bool restartAnimation;
  final VoidCallback? onAnimationEnd;
  final Widget? widgetIndicator;
  final bool rotateLinearGradient;
  final bool isPlay;
  final AnimationController animationController;

  CustomCircularPercentIndicator({
    Key? key,
    required this.animationController,
    required this.isPlay,
    this.percent = 0.0,
    this.lineWidth = 5.0,
    this.startAngle = 0.0,
    required this.radius,
    this.fillColor = Colors.transparent,
    this.backgroundColor = const Color(0xFFB8C7CB),
    Color? progressColor,
    this.backgroundWidth = -1,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 500,
    this.header,
    this.footer,
    this.center,
    this.addAutomaticKeepAlive = true,
    this.circularStrokeCap = CircularStrokeCap.butt,
    this.arcBackgroundColor,
    this.arcType,
    this.animateFromLastPercent = false,
    this.reverse = false,
    this.curve = Curves.linear,
    this.maskFilter,
    this.restartAnimation = false,
    this.onAnimationEnd,
    this.widgetIndicator,
    this.rotateLinearGradient = false,
  }) : super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError(
          'Cannot provide both linearGradient and progressColor');
    }
    _progressColor = progressColor ?? Colors.red;

    assert(startAngle >= 0.0);
    if (percent < 0.0 || percent > 1.0) {
      throw Exception(
          "Percent value must be a double between 0.0 and 1.0, but it's $percent");
    }

    if (arcType == null && arcBackgroundColor != null) {
      throw ArgumentError('arcType is required when you arcBackgroundColor');
    }
  }

  @override
  CustomCircularPercentIndicatorState createState() =>
      CustomCircularPercentIndicatorState();
}

class CustomCircularPercentIndicatorState extends State<CustomCircularPercentIndicator>
    with AutomaticKeepAliveClientMixin {
  Animation? _animation;
 // double _percent = 0.0;


  @override
  void initState() {
    if (widget.animation) {
      _animation = Tween(begin: 0.0, end: widget.percent).animate(
        CurvedAnimation(parent: widget.animationController, curve: widget.curve),
      )..addListener(() {
        if(mounted){
            setState(() {
           //   _percent = _animation!.value;
            });
          }
        });
      widget.animationController.addStatusListener((status) {
        if (widget.onAnimationEnd != null && status == AnimationStatus.completed) {
          widget.onAnimationEnd!();
        }
      });

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>.empty(growable: true);
    if (widget.header != null) {
      items.add(widget.header!);
    }
    items.add(
      SizedBox(
        height: widget.radius,
        width: widget.radius,
        child: Stack(
          children: [
            CustomPaint(
              painter: _CirclePainter(
                progress: (_animation!.value as double) * 360,
                progressColor: widget.progressColor,
                backgroundColor: widget.backgroundColor,
                startAngle: widget.startAngle,
                circularStrokeCap: widget.circularStrokeCap,
                radius: (widget.radius / 2) - widget.lineWidth / 2,
                lineWidth: widget.lineWidth,
                //negative values ignored, replaced with lineWidth
                backgroundWidth: widget.backgroundWidth >= 0.0
                    ? (widget.backgroundWidth)
                    : widget.lineWidth,
                arcBackgroundColor: widget.arcBackgroundColor,
                arcType: widget.arcType,
                reverse: widget.reverse,
                linearGradient: widget.linearGradient,
                maskFilter: widget.maskFilter,
                rotateLinearGradient: widget.rotateLinearGradient,
              ),
              child: (widget.center != null)
                  ? Center(child: widget.center)
                  : const SizedBox.expand(),
            ),
            if (widget.widgetIndicator != null && widget.animation)
              Positioned.fill(
                child: Transform.rotate(
                  angle: radians(
                      (widget.circularStrokeCap != CircularStrokeCap.butt &&
                          widget.reverse)
                          ? -15
                          : 0)
                      .toDouble(),
                  child: Transform.rotate(
                    angle: getCurrentPercent(),
                    child: Transform.translate(
                      offset: Offset(
                        (widget.circularStrokeCap != CircularStrokeCap.butt)
                            ? widget.lineWidth / 2
                            : 0,
                        (-widget.radius / 2 + widget.lineWidth / 2),
                      ),
                      child: widget.widgetIndicator,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    if (widget.footer != null) {
      items.add(widget.footer!);
    }

    return Material(
      color: widget.fillColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  double getCurrentPercent() {
    if (widget.arcType != null) {
      final angle = _getStartAngleFixedMargin(widget.arcType!).fixedStartAngle;
      final fixedPercent = 1.0 / widget.percent * (_animation!.value as double);
      late double margin;
      if (widget.arcType == ArcType.half) {
        margin = 180 * widget.percent;
      } else {
        margin = 270 * widget.percent;
      }
      return radians(angle + margin * fixedPercent).toDouble();
    } else {
      const angle = 360;
      return radians((widget.reverse ? -angle : angle) * (_animation!.value as double)).toDouble();
    }
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

_ArcAngles _getStartAngleFixedMargin(ArcType arcType) {
  double fixedStartAngle, startAngleFixedMargin;
  if (arcType == ArcType.full) {
    fixedStartAngle = 220;
    startAngleFixedMargin = 172 / fixedStartAngle;
  } else {
    fixedStartAngle = 270;
    startAngleFixedMargin = 135 / fixedStartAngle;
  }
  return _ArcAngles(
    fixedStartAngle: fixedStartAngle,
    startAngleFixedMargin: startAngleFixedMargin,
  );
}

class _ArcAngles {
  const _ArcAngles(
      {required this.fixedStartAngle, required this.startAngleFixedMargin});
  final double fixedStartAngle;
  final double startAngleFixedMargin;
}

class _CirclePainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final Paint _paintBackgroundStartAngle = Paint();
  final double lineWidth;
  final double backgroundWidth;
  final double progress;
  final double radius;
  final Color progressColor;
  final Color backgroundColor;
  final CircularStrokeCap circularStrokeCap;
  final double startAngle;
  final LinearGradient? linearGradient;
  final Color? arcBackgroundColor;
  final ArcType? arcType;
  final bool reverse;
  final MaskFilter? maskFilter;
  final bool rotateLinearGradient;

  _CirclePainter({
    required this.lineWidth,
    required this.backgroundWidth,
    required this.progress,
    required this.radius,
    required this.progressColor,
    required this.backgroundColor,
    this.startAngle = 0.0,
    this.circularStrokeCap = CircularStrokeCap.butt,
    this.linearGradient,
    required this.reverse,
    this.arcBackgroundColor,
    this.arcType,
    this.maskFilter,
    required this.rotateLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = backgroundWidth;
    _paintBackground.strokeCap = circularStrokeCap.strokeCap;

    if (arcBackgroundColor != null) {
      _paintBackgroundStartAngle.color = arcBackgroundColor!;
      _paintBackgroundStartAngle.style = PaintingStyle.stroke;
      _paintBackgroundStartAngle.strokeWidth = lineWidth;
      _paintBackgroundStartAngle.strokeCap = circularStrokeCap.strokeCap;
    }

    _paintLine.color = progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;
    _paintLine.strokeCap = circularStrokeCap.strokeCap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    double fixedStartAngle = startAngle;
    double startAngleFixedMargin = 1.0;
    if (arcType != null) {
      final arcAngles = _getStartAngleFixedMargin(arcType!);
      fixedStartAngle = arcAngles.fixedStartAngle;
      startAngleFixedMargin = arcAngles.startAngleFixedMargin;
    }
    if (arcType == null) {
      canvas.drawCircle(center, radius, _paintBackground);
    }

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }
    if (linearGradient != null) {
      if (rotateLinearGradient && progress > 0) {
        double correction = 0;
        if (_paintLine.strokeCap != StrokeCap.butt) {
          correction = math.atan(_paintLine.strokeWidth / 2 / radius);
        }
        _paintLine.shader = SweepGradient(
          transform: reverse
              ? GradientRotation(
              radians(-90 - progress + startAngle) - correction)
              : GradientRotation(radians(-90.0 + startAngle) - correction),
          startAngle: radians(0).toDouble(),
          endAngle: radians(progress).toDouble(),
          tileMode: TileMode.clamp,
          colors: reverse
              ? linearGradient!.colors.reversed.toList()
              : linearGradient!.colors,
        ).createShader(
          Rect.fromCircle(center: center, radius: radius),
        );
      } else if (!rotateLinearGradient) {
        _paintLine.shader = linearGradient!.createShader(
          Rect.fromCircle(center: center, radius: radius),
        );
      }
    }

    if (arcBackgroundColor != null) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        radians(-90.0 + fixedStartAngle).toDouble(),
        radians(360 * startAngleFixedMargin).toDouble(),
        false,
        _paintBackgroundStartAngle,
      );
    }

    if (reverse) {
      final start =
      radians(360 * startAngleFixedMargin - 90.0 + fixedStartAngle)
          .toDouble();
      final end = radians(-progress * startAngleFixedMargin).toDouble();
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = radians(-90.0 + fixedStartAngle).toDouble();
      final end = radians(progress * startAngleFixedMargin).toDouble();
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}