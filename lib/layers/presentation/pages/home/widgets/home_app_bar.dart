import 'package:test_technique/layers/presentation/shared/others/export.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.controller,
  });

  final UsersController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        duration: 1.seconds,
        opacity: !controller.isShowAppBar.value ? 0 : 1,
        child: BlurryContainer(
          height: 150,
          key: UniqueKey(),
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.zero,
          decoration: const BoxDecoration(
            color: Color.fromARGB(115, 255, 186, 243),
          ),
          blur: 8,
          child: CustomColumn(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "appname",
                      child: Image(
                        image: AssetImage(Assets.appName),
                        height: 20,
                      ),
                    ),

                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 234, 0, 255),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(3),
                        child: const EFadeInImage(
                            radius: 18,
                            image:
                                "https://randomuser.me/api/portraits/med/men/29.jpg")),
                    // 6.w,
                  ],
                ),
              ),
              // 9.h,
              CustomTextField(
                  onChanged: (value) async {
                    controller.searchText = value;
                  },
                  prefix: const Icon(Icons.search),
                  radius: 32,
                  placeholder: 'search first or last name',
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    print('laaa');
                    waitAfter(1000, () {
                      controller.search();
                    });
                  },
                  suffix: PopupMenuButton(
                    itemBuilder: (context) {
                      return ["all", "male", "female"]
                          .map((e) => PopupMenuItem(
                                child: CustomText(e.capitalizeFirst!),
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.currentGender.value = e;
                                  waitAfter(900, () {
                                    controller.search();
                                  });
                                },
                              ))
                          .toList();
                    },
                    onSelected: (value) {
                      print(value);
                    },
                    child: Container(
                      height: 40,
                      color: Colors.transparent,
                      child: Obx(
                        () => Row(
                          children: [
                            Container(
                              height: 22,
                              width: 2,
                              decoration: const BoxDecoration(color: Colors.black12),
                            ),
                            3.w,
                            GenderIcon(
                                currentGender: controller.currentGender.value),
                            6.w,
                            Text(
                              controller.currentGender.value.capitalizeFirst!,
                              style: TextStyle(
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                            6.w,
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            12.w,
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderIcon extends StatelessWidget {
  const GenderIcon({super.key, required this.currentGender});
  final currentGender;
  @override
  Widget build(BuildContext context) {
    return currentGender == User.allGender
        ? const Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                height: 22,
                width: 22,
              ),
              Icon(
                Icons.male,
                size: 16,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.female,
                  color: Colors.purple,
                  size: 16,
                ),
              ),
            ],
          )
        : currentGender == User.maleGender
            ? const Icon(
                Icons.male,
                size: 20,
              )
            : const Icon(
                Icons.female,
                size: 20,
              );
  }
}
