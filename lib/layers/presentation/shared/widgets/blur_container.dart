import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class BlurryContainer extends StatelessWidget {
  final Widget child;

  final double? height;

  final double? width;

  final double elevation;

  final double blur;

  final EdgeInsetsGeometry padding;

  final Color color;

  final BorderRadius borderRadius;

  final BoxDecoration? decoration;

  const BlurryContainer({
    Key? key,
    required this.child,
    this.decoration,
    this.height,
    this.width,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(0),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: padding,
           decoration: decoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
