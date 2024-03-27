import 'package:test_technique/layers/presentation/shared/others/export.dart';

abstract class Routes {
  static void toHome() {
    Get.off(
      const Home(),
      transition: Transition.rightToLeftWithFade,
      duration: 999.milliseconds,
    );
  }

  static void toUserDetails(User user) {
    Get.to(
        DetailPage(
          user: user,
        ),
        transition: Transition.fadeIn,
        duration: 999.milliseconds);
  }

  static void toSetUser({required User user, int? index}) {
    Get.to(
        SetUser(
          user: user,
          index: index,
        ),
        transition: Transition.fade,
        duration: 999.milliseconds);
  }

  static void back({int? number}) {
    for (var i = 0; i < (number ?? 1); i++) {
      Get.back();
    }
  }
}
