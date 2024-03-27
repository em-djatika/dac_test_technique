import 'package:test_technique/layers/presentation/shared/others/export.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key, required this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      physics: const BouncingScrollPhysics(),
      itemCount: listWidgets.length,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        return Obx(
          () => AnimatedPadding(
              padding:
                  EdgeInsets.only(top: controller.animateCard.value ? 0 : 35),
              duration: (600 * (index + 1)).milliseconds,
              child: listWidgets[index]),
        );
      },
    );
  }

  List<Widget> get listWidgets => [
        150.h,
        ...controller.dynamicUsers.value
            .map((user) => GestureDetector(
                  onTap: () {
                    Routes.toUserDetails(user);
                  },
                  child: UserCard(
                    user: user,
                  ),
                ))
            .toList(),
        60.h,
      ];
}
