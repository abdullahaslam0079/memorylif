//
// // ignore_for_file: constant_identifier_names
//
// import 'package:chatgptcenteral/ui/base/base_widget.dart';
// import 'package:flutter/material.dart';
//
//
// typedef PathBuilder = Path Function(Size);
//
// class DottedBorder extends BaseStateLessWidget {
//   final Widget child;
//   final EdgeInsets padding;
//   final double strokeWidth;
//   final double elevation;
//   final Color color;
//   final List<double> dashPattern;
//   final BorderType borderType;
//   final Radius radius;
//   final PathBuilder? customPath;
//   final StrokeCap strokeCap;
//
//    DottedBorder({Key? key,
//     required this.child,
//     this.color = Colors.black,
//     this.strokeWidth = 1,
//      this.elevation  = 4.0,
//     this.borderType = BorderType.Rect,
//     this.dashPattern = const <double>[3, 1],
//     this.padding = const EdgeInsets.all(1),
//     this.radius = const Radius.circular(0),
//     this.customPath,
//     this.strokeCap = StrokeCap.butt,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _DashPainter(
//         strokeWidth: strokeWidth,
//         radius: radius,
//         color: color,
//         elevation: elevation,
//         borderType: borderType,
//         dashPattern: dashPattern,
//         customPath: customPath,
//         strokeCap: strokeCap,
//       ),
//       child: Padding(
//         padding: padding,
//         child: child,
//       ),
//     );
//   }
// }
//
//
// class _DashPainter extends CustomPainter {
//   final double strokeWidth;
//   final List<double> dashPattern;
//   final Color color;
//   final BorderType borderType;
//   final Radius radius;
//   final PathBuilder? customPath;
//   final StrokeCap strokeCap;
//   final double elevation;
//
//   _DashPainter({
//     this.strokeWidth = 2,
//     this.dashPattern = const <double>[3, 1],
//     this.color = Colors.black,
//     this.borderType = BorderType.Rect,
//     this.radius = const Radius.circular(0),
//     this.customPath,
//     this.elevation = 4.0,
//     this.strokeCap = StrokeCap.butt,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..strokeWidth = strokeWidth
//       ..color = color
//       ..strokeCap = strokeCap
//       ..style = PaintingStyle.stroke;
//
//     Path path;
//     if (customPath != null) {
//       path = dashPath(
//         customPath!(size),
//         dashArray: CircularIntervalList(dashPattern),
//       );
//     } else {
//       path = _getPath(size);
//     }
//     canvas.drawShadow(path, Colors.grey, elevation, false);
//
//     canvas.drawPath(path, paint);
//   }
//
//   Path _getPath(Size size) {
//     Path path;
//     switch (borderType) {
//       case BorderType.Circle:
//         path = _getCirclePath(size);
//         break;
//       case BorderType.RRect:
//         path = _getRRectPath(size, radius);
//         break;
//       case BorderType.Rect:
//         path = _getRectPath(size);
//         break;
//       case BorderType.Oval:
//         path = _getOvalPath(size);
//         break;
//     }
//
//     return dashPath(path, dashArray: CircularIntervalList(dashPattern));
//   }
//
//   Path _getCirclePath(Size size) {
//     double w = size.width;
//     double h = size.height;
//     double s = size.shortestSide;
//
//     return Path()
//       ..addRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(
//             w > s ? (w - s) / 2 : 0,
//             h > s ? (h - s / 2) : 0,
//             s,
//             s,
//           ),
//           Radius.circular(s / 2),
//         ),
//       );
//   }
//
//   Path _getRRectPath(Size size, Radius radius) {
//     return Path()
//       ..addRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(
//             0,
//             0,
//             size.width,
//             size.height,
//           ),
//           radius,
//         ),
//       );
//   }
//
//   Path _getRectPath(Size size) {
//     return Path()
//       ..addRect(
//         Rect.fromLTWH(
//           0,
//           0,
//           size.width,
//           size.height,
//         ),
//       );
//   }
//
//   Path _getOvalPath(Size size) {
//     return Path()
//       ..addOval(
//         Rect.fromLTWH(
//           0,
//           0,
//           size.width,
//           size.height,
//         ),
//       );
//   }
//
//   @override
//   bool shouldRepaint(_DashPainter oldDelegate) {
//     return true;
//   }
// }
//
//
//
// enum BorderType { Circle, RRect, Rect, Oval }
