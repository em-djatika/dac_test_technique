import 'package:test_technique/layers/presentation/shared/others/export.dart';

class TwoOptionsDialog extends StatelessWidget {
  const TwoOptionsDialog(
      {super.key,
      required this.confirmFunction,
      required this.body,
      required this.title});
  final confirmFunction;
  final title;
  final body;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.h,
            CustomText(
              title,
              size: 28,
              weight: FontWeight.bold,
              color: AppColors.purple,
            ),
            12.h,
            CustomText(
              body,
              maxLines: 3,
              align: TextAlign.center,
            ),
            12.h,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.purple),
                          borderRadius: BorderRadius.circular(12)),
                      child: CustomText('Non',
                          color: AppColors.purple, ),
                ),),
                9.w,
                GestureDetector(
                  onTap: confirmFunction,
                  child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const CustomText('Oui',
                          color: Colors.white, )),
                ),
              ],
            ),
            12.h,
          ],
        ),
      ),
    );
  }
}
