import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:stylex/stylex.dart';

/// Utility functions for styling widgets faster & easier.

EdgeInsetsGeometry padding({
  double all,
  double horizontal,
  double vertical,
  double top,
  double bottom,
  double left,
  double right,
}) {
  return EdgeInsets.only(
    top: top ?? vertical ?? all ?? 0.0,
    bottom: bottom ?? vertical ?? all ?? 0.0,
    left: left ?? horizontal ?? all ?? 0.0,
    right: right ?? horizontal ?? all ?? 0.0,
  );
}

EdgeInsetsGeometry margin({
  double all,
  double horizontal,
  double vertical,
  double top,
  double bottom,
  double left,
  double right,
}) {
  return EdgeInsets.only(
    top: top ?? vertical ?? all ?? 0.0,
    bottom: bottom ?? vertical ?? all ?? 0.0,
    left: left ?? horizontal ?? all ?? 0.0,
    right: right ?? horizontal ?? all ?? 0.0,
  );
}

Gradient linearGradient({
  @required List<Color> colors,
  AlignmentGeometry begin = Alignment.centerLeft,
  AlignmentGeometry end = Alignment.centerRight,
  TileMode tileMode = TileMode.clamp,
  List<double> stops,
}) {
  return LinearGradient(
    begin: begin,
    end: end,
    colors: colors,
    tileMode: tileMode,
    stops: stops,
  );
}

Gradient radialGradient({
  @required double radius,
  @required List<Color> colors,
  AlignmentGeometry center = Alignment.center,
  TileMode tileMode = TileMode.clamp,
  List<double> stops,
}) {
  return RadialGradient(
    center: center,
    radius: radius,
    colors: colors,
    tileMode: tileMode,
    stops: stops,
  );
}

Gradient sweepGradient({
  @required double endAngle,
  @required List<Color> colors,
  AlignmentGeometry center = Alignment.center,
  TileMode tileMode = TileMode.clamp,
  double startAngle = 0.0,
  List<double> stops,
  AngleFormat angleFormat,
}) {
  return SweepGradient(
    center: center,
    startAngle: angleToRadians(startAngle, angleFormat),
    endAngle: angleToRadians(endAngle, angleFormat),
    colors: colors,
    stops: stops,
    tileMode: tileMode,
  );
}

BoxBorder border({
  double all,
  double left,
  double right,
  double top,
  double bottom,
  Color color = const Color(0xFF000000),
  BorderStyle style = BorderStyle.solid,
}) {
  return Border(
    left: (left ?? all) == null
        ? BorderSide.none
        : BorderSide(color: color, width: left ?? all, style: style),
    right: (right ?? all) == null
        ? BorderSide.none
        : BorderSide(color: color, width: right ?? all, style: style),
    top: (top ?? all) == null
        ? BorderSide.none
        : BorderSide(color: color, width: top ?? all, style: style),
    bottom: (bottom ?? all) == null
        ? BorderSide.none
        : BorderSide(color: color, width: bottom ?? all, style: style),
  );
}

BorderRadiusGeometry borderRadius({
  double all,
  double topLeft,
  double topRight,
  double bottomLeft,
  double bottomRight,
}) {
  return BorderRadius.only(
    topLeft: Radius.circular(topLeft ?? all ?? 0.0),
    topRight: Radius.circular(topRight ?? all ?? 0.0),
    bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
    bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
  );
}

BoxShape circle([enable = true]) => enable ? BoxShape.circle : null;

BoxShadow boxShadow({
  Color color = const Color(0x33000000),
  double blur = 0.0,
  Offset offset = Offset.zero,
  double spread = 0.0,
}) {
  return BoxShadow(
    color: color,
    blurRadius: blur,
    spreadRadius: spread,
    offset: offset,
  );
}

BoxShadow elevation(
  double elevation, {
  double angle = 0.0,
  Color color = const Color(0x33000000),
  double opacity = 1.0,
  AngleFormat angleFormat,
}) {
  if (elevation == 0) return null;

  angle = angleToRadians(angle, angleFormat);
  final double offsetX = sin(angle) * elevation;
  final double offsetY = cos(angle) * elevation;

  double calculatedOpacity = (0.5 - (sqrt(elevation) / 19)) * opacity;
  if (calculatedOpacity < 0.0) calculatedOpacity = 0.0;

  final Color colorWithOpacity = color.withOpacity(calculatedOpacity);

  return BoxShadow(
    color: colorWithOpacity,
    blurRadius: elevation,
    spreadRadius: 0.0,
    offset: Offset(offsetX, offsetY),
  );
}

double rotate(double angle, {AngleFormat angleFormat = AngleFormat.degree}) =>
    angleToRadians(angle, angleFormat);

RippleModel ripple(bool enable, {Color splashColor, Color highlightColor}) {
  return RippleModel(
    enable: enable,
    splashColor: splashColor,
    highlightColor: highlightColor,
  );
}
