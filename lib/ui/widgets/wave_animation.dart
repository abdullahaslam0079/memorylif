// import 'package:chatgptcenteral/application/core/extensions/extensions.dart';
// import 'package:chatgptcenteral/constant/style.dart';
// import 'package:chatgptcenteral/ui/base/base_widget.dart';
// import 'package:flutter/material.dart';
//
// class WaveAnimation extends BaseStateFullWidget {
//      WaveAnimation({Key? key, this.child, this.showBorder = true, this.showLoader = false})
//       : super(key: key);
//   final Widget? child;
//   final bool showBorder;
//   final bool showLoader;
//   @override
//   WaveAnimationState createState() => WaveAnimationState();
// }
//
// class WaveAnimationState extends State<WaveAnimation> with TickerProviderStateMixin {
//   late final AnimationController waveController;
//   late final Animation<double>? waveAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//       waveController = AnimationController(duration: const Duration(seconds: 5), vsync: this);
//       waveAnimation = Tween(begin: 0.6, end: 1.0).animate(waveController);
//       if (mounted) {
//         waveController
//           ..forward()
//           ..addListener(() {
//             setState(() {});
//             if (waveController.isCompleted) {
//               waveController.repeat(reverse: true, min: 0.6, max: 1.0);
//             }
//           });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(9999)),
//       child: Container(
//         color: Style.scaffoldBackground,
//         child: widget.child,
//       ),
//     );
//     if (widget.showBorder) {
//       child = Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: child,
//       );
//     }
//
//     return SizedBox(
//       width: context.width,
//       height: context.getHeight(0.48),
//       child: Stack(
//         children: <Widget>[
//           Center(
//             child: Container(
//               width: 153.0 * (waveAnimation?.value ?? 0.0),
//               height: 153.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x4dffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 183.0 * (waveAnimation?.value ?? 0.0),
//               height: 183.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x33ffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 207.0 * (waveAnimation?.value ?? 0.0),
//               height: 207.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x26ffffff)),
//               ),
//             ),
//           ),
//           if (widget.showLoader)
//             Center(
//               child: CustomPaint(
//                 size: const Size(231, 231),
//                 painter: LoaderPaint(percentage: waveController.value),
//               ),
//             ),
//           Center(
//             child: Container(
//               width: 231.0 * (waveAnimation?.value ?? 0.0),
//               height: 231.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x1affffff)),
//               ),
//               //  margin:  EdgeInsets.all(88.0 * (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 255.0 * (waveAnimation?.value ?? 0.0),
//               height: 255.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x14ffffff)),
//               ),
//               // margin:  EdgeInsets.all(67.0* (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 279.0 * (waveAnimation?.value ?? 0.0),
//               height: 279.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x0fffffff)),
//               ),
//               //  margin:  EdgeInsets.all(46.0* (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 303.0 * (waveAnimation?.value ?? 0.0),
//               height: 303.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x0affffff)),
//               ),
//               margin: EdgeInsets.all(25.0 * (1 - (waveAnimation?.value ?? 0.0))),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 327.0 * (waveAnimation?.value ?? 0.0),
//               height: 327.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x08ffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//                 width: 130.0, height: 130.0, decoration: widget.showBorder ? Style.sectionBoxGradientDecoration(radius: 9999.0) : null, child: child),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     if (!widget.showLoader) {
//       waveController.dispose();
//     }
//
//     super.dispose();
//   }
// }
//
// class WaveAnimation2 extends BaseStateFullWidget {
//   WaveAnimation2({Key? key, this.child, this.showBorder = true, this.showLoader = false, this.durationAnimation, this.waveAnimation})
//       : super(key: key);
//   final Widget? child;
//   final bool showBorder;
//   final bool showLoader;
//   final Animation<double>? durationAnimation;
//   final Animation<double>? waveAnimation;
//
//   @override
//   WaveAnimation2State createState() => WaveAnimation2State();
// }
//
// class WaveAnimation2State extends State<WaveAnimation2> with TickerProviderStateMixin {
//   late final Animation<double>? waveAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     waveAnimation = widget.waveAnimation;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(9999)),
//       child: Container(
//         color: Style.scaffoldBackground,
//         child: widget.child,
//       ),
//     );
//     if (widget.showBorder) {
//       child = Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: child,
//       );
//     }
//
//     return SizedBox(
//       width: context.width,
//       height: context.getHeight(0.48),
//       child: Stack(
//         children: <Widget>[
//           Center(
//             child: Container(
//               width: 153.0 * (waveAnimation?.value ?? 0.0),
//               height: 153.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x4dffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 183.0 * (waveAnimation?.value ?? 0.0),
//               height: 183.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x33ffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 207.0 * (waveAnimation?.value ?? 0.0),
//               height: 207.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x26ffffff)),
//               ),
//             ),
//           ),
//           if (widget.showLoader)
//             Center(
//               child: CustomPaint(
//                 size: const Size(231, 231),
//                 painter: LoaderPaint(percentage: widget.durationAnimation?.value ?? 0.0),
//               ),
//             ),
//           Center(
//             child: Container(
//               width: 231.0 * (waveAnimation?.value ?? 0.0),
//               height: 231.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x1affffff)),
//               ),
//               //  margin:  EdgeInsets.all(88.0 * (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 255.0 * (waveAnimation?.value ?? 0.0),
//               height: 255.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x14ffffff)),
//               ),
//               // margin:  EdgeInsets.all(67.0* (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 279.0 * (waveAnimation?.value ?? 0.0),
//               height: 279.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x0fffffff)),
//               ),
//               //  margin:  EdgeInsets.all(46.0* (1 - animation1.value)),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 303.0 * (waveAnimation?.value ?? 0.0),
//               height: 303.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x0affffff)),
//               ),
//               margin: EdgeInsets.all(25.0 * (1 - (waveAnimation?.value ?? 0.0))),
//             ),
//           ),
//           Center(
//             child: Container(
//               width: 327.0 * (waveAnimation?.value ?? 0.0),
//               height: 327.0 * (waveAnimation?.value ?? 0.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(9999)),
//                 border: Border.all(width: 1.5, color: const Color(0x08ffffff)),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//                 width: 130.0, height: 130.0, decoration: widget.showBorder ? Style.sectionBoxGradientDecoration(radius: 9999.0) : null, child: child),
//           ),
//         ],
//       ),
//     );
//   }
// }
