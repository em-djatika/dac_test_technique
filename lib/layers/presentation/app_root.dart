import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_technique/layers/presentation/controllers_bindings/bindings/users_binding.dart';
import 'package:test_technique/layers/presentation/pages/loading/first_loading.dart';
import 'package:test_technique/layers/presentation/configs/theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});
  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.base(),
      home: const OpenAppLoading(),
      initialBinding: UsersBinding(),
    );
  }
}
