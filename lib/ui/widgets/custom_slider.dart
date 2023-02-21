import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';

import '../../constant/style.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<double>? onChanged;
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value = 6.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: Style.splashBackgroundLinearDecoration().copyWith(borderRadius: BorderRadius.circular(15)),
      // margin: EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: Style.gaugeGradient),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      trackHeight: 4.0,
                      thumbShape: CustomSlideThumbShape(min: 1, max: 10),
                      thumbColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 3),
                      activeTickMarkColor: Colors.teal,
                      inactiveTickMarkColor: Colors.teal,
                      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.transparent,
                      valueIndicatorTextStyle: const TextStyle(color: Colors.transparent)),
                  child: Slider(
                      value: _value.toDouble(),
                      min: 1.0,
                      max: 10.0,
                      divisions: 10,
                      label: 'Set volume value',
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue;
                        });
                        widget.onChanged!(newValue);
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()} dollars';
                      }),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Low",
                        style: context.textTheme.caption?.copyWith(color: Style.accentColor),
                      ),
                      Text(
                        "High",
                        style: context.textTheme.caption?.copyWith(color: Style.accentColor),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text('Low',
                  style: context.textTheme.headline6?.copyWith(
                      color: Style.backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Raleway"),
                  textAlign: TextAlign.center)
              .addPadding(const EdgeInsets.symmetric(horizontal: 12))
        ],
      ),
    );
  }
}

class CustomSlideThumbShape extends SliderComponentShape {
  final int max;
  final int min;

  CustomSlideThumbShape({required this.max, required this.min});
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(50, 100);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    // path.moveTo(center.dx, center.dy);
    // path.lineTo(center.dx + 12, center.dy - 15);
    // path.lineTo(center.dx - 10, center.dy - 15);
    // path.close();
    // context.canvas.drawPath(
    //     path,
    //     Paint()
    //       ..color = Colors.teal
    //       ..style = PaintingStyle.fill
    //       ..strokeWidth = 2);
    // canvas.drawShadow(
    //     Path()
    //       ..addRRect(RRect.fromRectAndRadius(
    //         Rect.fromCenter(center: center, width: 24, height: 30),
    //         const Radius.circular(4),
    //       )),
    //     Colors.black,
    //     5,
    //     false);
    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(
    //     Rect.fromCenter(center: center, width: 20, height: 30),
    //     const Radius.circular(4),
    //   ),
    //   Paint()..color = Colors.teal,
    // );
    const Size size = Size(30.998, 62.692);
    Path path_0 = Path();
    canvas.translate(center.dx - 16, -48);
    path_0.moveTo(29.667, 21.557);
    path_0.arcToPoint(const Offset(1.2570000000000014, 21.557),
        radius: const Radius.elliptical(15.5, 15.5), rotation: 0, largeArc: true, clockwise: false);
    path_0.cubicTo(3.2570000000000014, 28.025, 9.626000000000001, 35.375, 10.278000000000002, 43.474000000000004);
    path_0.cubicTo(
        10.930000000000003, 51.57300000000001, 10.922000000000002, 50.652, 10.572000000000003, 57.153000000000006);
    path_0.arcToPoint(const Offset(10.572000000000003, 57.71600000000001),
        radius: const Radius.elliptical(4.34, 4.34), rotation: 0, largeArc: false, clockwise: false);
    path_0.arcToPoint(const Offset(20.646, 57.71600000000001),
        radius: const Radius.elliptical(5.041, 5.041), rotation: 0, largeArc: false, clockwise: false);
    path_0.lineTo(20.646, 57.55300000000001);
    path_0.lineTo(20.646, 57.55300000000001);
    path_0.cubicTo(20.271, 50.95300000000001, 20.246000000000002, 51.63900000000001, 20.915, 43.47400000000001);
    path_0.cubicTo(21.583999999999996, 35.30900000000001, 27.726, 28.018, 29.667, 21.557);
    path_0.close();
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
    Path path_1 = Path();
    path_1.moveTo(12.806, 0);
    path_1.arcToPoint(const Offset(0, 12.806),
        radius: const Radius.elliptical(12.806, 12.806), rotation: 0, largeArc: true, clockwise: true);
    path_1.arcToPoint(const Offset(10.806, 0),
        radius: const Radius.elliptical(12.806, 12.806), rotation: 0, largeArc: false, clockwise: true);
    path_1.close();
    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff5bcd89).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.498779, size.height * 0.2534014), 12.69, paint_1_fill);
    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff475063).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.49779, size.height * 0.90334014), 3.69, paint_2_fill);
    TextSpan span = TextSpan(
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white, height: 1),
        text: (min + (max - min) * value).round().toString());
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter = Offset(Offset(size.width * 0.498779, size.height * 0.2534014).dx - (tp.width / 2),
        Offset(size.width * 0.498779, size.height * 0.2534014).dy - (tp.height / 2));
    tp.paint(canvas, textCenter);
  }
}
