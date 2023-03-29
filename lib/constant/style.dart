import 'package:flutter/material.dart';

class Style {
  // static const primaryColor = Color(0xff0C9393);
  static const primaryColor = Color(0xff428C75);
  static const accentColor = Color(0xffFFE454);
  static const textColor = Color(0xff1A1A1A);
  static const cardColor = Color(0xffDEE7E1);
  static const whiteColor = Color(0xffffffff);
  static const redColor = Color(0xffEC1717);
  static const backgroundColor = whiteColor;




  static const splashBackgroundDecoration = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.468,
      colors: [Color(0xffffffff), Color(0xffe5f5fb)],
      stops: [0.0, 1.0],
    ),
  );
  static BoxDecoration splashBackgroundLinearDecoration ({double opacity = 0.15,bool applyGradient = true, AlignmentGeometry begin =  Alignment.centerLeft, AlignmentGeometry end =  Alignment.centerRight}) => BoxDecoration(
    gradient: applyGradient? LinearGradient(
      begin: begin,
      end: end,
      colors: [const Color(0xff206EAF).withOpacity(opacity), const Color(0xff39CFA8).withOpacity(opacity)],
    ):null,
  );

  static const trackGradient = LinearGradient(
    begin: Alignment(1.151, 6.586),
    end: Alignment(-1.05, -8.099),
    colors: [Color(0x33206eaf), Color(0x3339cfa8)],
    stops: [0.0, 1.0],
  );
  static const barGradient =  LinearGradient(
    begin: Alignment(1.151, 6.586),
    end: Alignment(-1.05, -8.099),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );


  static const gaugeGradient = LinearGradient(colors: [
    Color(0xff39CFA8),
    Color(0xffE4C711),
    Color(0xffEC1717),
  ]);

  static const baseGradient = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );
  static const baseGradient2 = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [Color(0xff781ff5), Color(0xffea73d6)],
    stops: [0.0, 1.0],
  );

  static const lightGradient = LinearGradient(
    begin: Alignment(-1.135, -1.058),
    end: Alignment(1.0, -0.414),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );
  static const boxGradient = LinearGradient(
    begin: Alignment(-1.0, -0.759),
    end: Alignment(1.0, 1.0),
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );

 static const progressBarGradient =  LinearGradient(
  colors: [Style.primaryColor, Style.accentColor],
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  );

  static const lineGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [primaryColor, accentColor],
    stops: [0.0, 1.0],
  );

static BoxDecoration imageDecoration(String path) =>  BoxDecoration(image: DecorationImage(image: AssetImage(path)));


  static BoxDecoration customGradientBackground({double? radius, BorderRadius? borderRadius, required LinearGradient gradient}) => BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 20),
      );



  //background screen
  static const BoxDecoration baseBackground = BoxDecoration(gradient: baseGradient);

  static const BoxDecoration baseBackground2 = BoxDecoration(gradient: baseGradient2,);

  //buttons, tabs etc
  static BoxDecoration sectionBoxGradientDecoration({double? radius, BorderRadius? borderRadius,Gradient? gradient,bool applyGradient = true }) => BoxDecoration(
        gradient:applyGradient ? gradient?? boxGradient: null,
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 20),
      );

  //single color buttons, tabs etc
  static BoxDecoration sectionBoxDecoration({double? radius, BorderRadius? borderRadius, required Color color}) => BoxDecoration(
        color: color,

        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
      );


  static BoxDecoration sectionToggleBoxDecoration({double? radius, BorderRadius? borderRadius, Color? color,required bool isGradient}) => BoxDecoration(
    color: color,
    gradient: isGradient ? boxGradient:null,
    borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
  );
}
