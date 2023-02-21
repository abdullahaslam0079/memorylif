import 'package:flutter/material.dart';

class CustomTabBarUnderlineTabIndicator extends Decoration {
  const CustomTabBarUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 3.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    required this.gradient,
  });

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;
  final LinearGradient gradient;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged, gradient);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged, this.linearGradient)
      : super(onChanged);
  final LinearGradient linearGradient;
  final CustomTabBarUnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration._indicatorRectFor(rect, textDirection).deflate(decoration.borderSide.width / 2.0);
    final Paint paint = decoration.borderSide.toPaint()..strokeCap = StrokeCap.round;
    paint.shader = linearGradient.createShader(rect);
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
