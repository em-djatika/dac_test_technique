
import 'package:test_technique/layers/presentation/shared/others/export.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({super.key, required this.message, this.confirm});
  final message;
  final VoidCallback? confirm;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.h,
            Icon(Icons.warning_rounded,
                size: 50, color: AppColors.purple),
            9.h,
            CustomText(message,
                align: TextAlign.center,
            
                maxLines: 20,
                size: 20),
            12.h,
            SimpleButton(
              onTap: confirm ??
                  () {
                    Get.back();
                  },
              text: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
