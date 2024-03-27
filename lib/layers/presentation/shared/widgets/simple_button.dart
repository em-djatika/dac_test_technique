// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:test_technique/layers/presentation/shared/others/export.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {Key? key,
      required this.onTap,
      this.width,
      this.text,
      this.child,
      this.color,
      this.radius,
      this.smallHeight})
      : super(key: key);
  final VoidCallback? onTap;
  final String? text;
  final Widget? child;
  final Color? color;
  final bool? smallHeight;
  final double? radius;
  final double? width;
  @override
  Widget build(BuildContext context) {
    if (text == null && child == null) {
      throw Exception("child an text can't be null");
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        constraints: BoxConstraints(minWidth: width ?? (Get.width / 2 - 20)),
        width: width,
        // padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: color ?? AppColors.purple,
            borderRadius: BorderRadius.circular(radius ?? 12)),
        child: text == null
            ? child
            : CustomText(
                text!,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
      ),
    );
  }
}
