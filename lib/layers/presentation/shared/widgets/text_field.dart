import 'package:flutter/cupertino.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.onChanged,
      this.placeholder,
      this.onSubmitted,
      this.smallHeight,
      this.maxLength,
      this.number,
      this.pass,
      this.suffix,
      this.align,
      this.maxLines,
      this.minLines,
      this.initialValue,
      this.onTap,
      this.prefix,
      this.radius,
      this.letterSapcing,
      this.textInputAction,
      this.weight,
      this.textColor,
      this.inputFormatter});
  Function(String) onChanged;
  Function(String?)? onSubmitted;
  String? placeholder;
  bool? number;
  int? maxLength;
  bool? pass;
  bool? smallHeight;
  Widget? suffix;
  TextAlign? align;
  int? maxLines;
  int? minLines;
  String? initialValue;
  VoidCallback? onTap;
  Widget? prefix;
  double? letterSapcing;
  double? radius;
  TextInputAction? textInputAction;
  FontWeight? weight;
  Color? textColor;
  final inputFormatter;

  @override
  Widget build(BuildContext context) {
    var phoneScallerFactor = MediaQuery.of(context).textScaleFactor;
      TextEditingController controller = TextEditingController(text: initialValue);


    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: CupertinoTextField(
        readOnly: onTap == null ? false : true,
        onTap: onTap,
        controller: controller,
        obscureText: pass == true ? true : false,
        padding: EdgeInsets.symmetric(
          vertical: smallHeight == null ? 16 : 8,
          horizontal: 8,
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: pass == true ? 1 : maxLines,
        minLines: minLines,
        placeholder: placeholder??"Saisissez",
        prefix: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: prefix,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: const Color.fromARGB(109, 249, 233, 255),
            borderRadius: BorderRadius.circular(radius ?? 12)),
        placeholderStyle: TextStyle(
            color: Colors.black38,
            fontFamily: Fonts.poppins,
            fontWeight: FontWeight.normal,
            fontSize: 18),
        textInputAction: textInputAction,
        keyboardType: pass == true
            ? TextInputType.text
            : number == null
                ? maxLines == null
                    ? TextInputType.text
                    : TextInputType.multiline
                : TextInputType.number,
        cursorColor: AppColors.violet,
        textAlign: align ?? TextAlign.start,
        style: TextStyle(
            letterSpacing: letterSapcing ?? .6,
            color:textColor?? AppColors.violet,
            fontFamily: Fonts.poppins,
            fontWeight:weight?? FontWeight.normal,
            fontSize: 19 * .7 / phoneScallerFactor),
        suffix: suffix,
        inputFormatters: inputFormatter,
      ),
    );
  }
}
