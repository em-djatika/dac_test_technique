// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:lottie/lottie.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';

class EError extends StatelessWidget {
  const EError({Key? key, this.error, this.retry}) : super(key: key);
  final String? error;
  final retry;

  @override
  Widget build(BuildContext context) {
    return EScaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.h,
            SizedBox(height: 190, child: Lottie.asset(Assets.error)),
            18.h,
            const CustomText(
              "Une erreur s'est produite. veuillez verifier votre Connexion internet ",
              maxLines: 5,
              align: TextAlign.center,
            ),
            24.h,
            SimpleButton(
              color: const Color.fromARGB(255, 187, 31, 214),
              width: Get.width / 2,
              onTap: retry,
              text: "Réessayer",
              smallHeight: true,
            )
          ],
        ),
      ),
    );
  }
}
