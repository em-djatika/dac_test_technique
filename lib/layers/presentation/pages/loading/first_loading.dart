import 'package:test_technique/layers/presentation/shared/others/export.dart';
import 'package:test_technique/layers/presentation/shared/views/error.dart';
import 'package:test_technique/layers/presentation/shared/widgets/warning.dart';

class OpenAppLoading extends StatelessWidget {
  const OpenAppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UsersController>();

    return FutureBuilder(
        future: controller.fetchUsers(),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? EError(
                  retry: () async {
                    Get.dialog(Center(
                      child: SizedBox(
                        key: UniqueKey(),
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.5,
                          color: AppColors.purple,
                        ),
                      ),
                    ));
                    try {
                      await controller.fetchUsers();
                    } on Exception {
                      Get.back();

                      Get.dialog(const WarningWidget(
                        message: "Une erreur s'est produite",
                      ));
                    }
                  },
                )
              : EScaffold(
                  body: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Center(
                          child: Hero(
                            tag: "appname",
                            child: Image(
                              key: UniqueKey(),
                              image: AssetImage(Assets.appName),
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          child: Obx(
                            () => AnimatedSwitcher(
                              duration: 888.milliseconds,
                              child: controller.fetchEnd.value
                                  ? 0.h
                                  : SizedBox(
                                      key: UniqueKey(),
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3.5,
                                        color: AppColors.purple,
                                      ),
                                    ),
                            ),
                          ))
                    ],
                  ),
                );
        });
  }
}
