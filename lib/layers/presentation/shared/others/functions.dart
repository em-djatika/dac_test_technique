import 'dart:ui';

import 'package:get/get.dart';

waitAfter(int milliseconds, VoidCallback function) async {
  await Future.delayed(milliseconds.milliseconds, function);
}
