import 'package:get/get.dart';
import 'package:test_technique/layers/presentation/controllers_bindings/controllers/uers_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }
}
