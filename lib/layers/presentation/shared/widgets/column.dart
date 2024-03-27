import 'package:flutter/material.dart';


class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key, required this.children, this.crossAxisAlignment});
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
