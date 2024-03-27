// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_technique/layers/presentation/shared/constants/fonts.dart';


class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.font,
      this.maxLines,
      this.letterSpacing,
      this.underline,
      this.lineThrought});
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final String? font;
  final int? maxLines;
  final double? letterSpacing;
  final bool? underline;
  final bool? lineThrought;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          letterSpacing: letterSpacing,
          color: color ?? Colors.black,
          fontSize: size ?? 19.0,
          fontFamily: font ?? Fonts.poppins,
          fontWeight: weight ?? FontWeight.normal,
          decoration: lineThrought == true
              ? TextDecoration.lineThrough
              : underline != true
                  ? TextDecoration.none
                  : TextDecoration.underline),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      textScaleFactor: .7,
      overflow: TextOverflow.ellipsis,
    );
  }
}
