import 'package:lottie/lottie.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: CustomColumn(
        children: [
          180.h,
          Lottie.asset(Assets.empty),
        ],
      ),
    );
  }
}
