import 'package:test_technique/layers/presentation/shared/others/export.dart';

import '../../../../shared/widgets/warning.dart';

class SetUser extends StatelessWidget {
  SetUser({super.key, required this.user, this.index});
  int? index;
  User user;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UsersController>();
    var currentGender = user.gender.obs;

    return EScaffold(
        // appBar: AppBar(title: CustomText('Add Uesr', color: AppColors.purple)),
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: CustomColumn(
            children: [
              65.h,
              CustomText('Gender *', color: AppColors.purple),
              Obx(
                () => CustomTextField(
                  initialValue: currentGender.value,
                  onChanged: (value) {},
                  onTap: () {
                    chooseGender(context, currentGender);
                  },
                  suffix: const Icon(Icons.arrow_drop_down_rounded),
                ),
              ),
              CustomText('Title *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.name.title,
                onChanged: (value) {
                  user.name.title = value;
                },
              ),
              CustomText('First name *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.name.first,
                onChanged: (value) {
                  user.name.first = value;
                },
              ),
              CustomText('Last Name *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.name.last,
                onChanged: (value) {
                  user.name.last = value;
                },
              ),
              CustomText('Age *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.dob.age.toString(),
                number: true,
                maxLength: 3,
                onChanged: (value) {
                  user.dob.age = int.tryParse(value) ?? 0;
                },
              ),
              CustomText('Country *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.location.country,
                onChanged: (value) {
                  user.location.country = value;
                },
              ),
              CustomText('City *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.location.city,
                onChanged: (value) {
                  user.location.city = value;
                },
              ),
              CustomText('Phone number *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.phone,
                number: true,
                maxLength: 18,
                onChanged: (value) {
                  user.phone = value;
                },
              ),
              CustomText('Image link *', color: AppColors.purple),
              CustomTextField(
                initialValue: user.picture.large,
                onChanged: (value) {
                  user.picture.large = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SimpleButton(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (badEnter) {
                      Get.dialog(const WarningWidget(
                        message: "Tous les champs sont requis !!!",
                      ));
                    } else {
                      if (user.id.isNul) {
                        LocalStorageImpl().addUser(user);
                        Routes.back(number: 2);

                        waitAfter(1000, () {
                          controller.allUser.insert(0, user);
                          controller.search();
                        });
                      } else {
                        controller.allUser[index!] = user;
                        LocalStorageImpl().updateUser(user);
                        Routes.back(number: 2);

                        waitAfter(1500, () {
                          controller.search();
                        });
                      }
                    }
                    // print('good', color: AppColors.purple);
                  },
                  text: 'Save',
                ),
              )
            ],
          ),
        ),
        Hero(
          tag: 'float',
          child: Container(
            height: 75,
            width: Get.width,
            decoration: BoxDecoration(color: AppColors.purple),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Routes.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    )),
                6.w,
                CustomText(
                  '${user.id.isNul ? "Add" : "Edit"} User',
                  color: Colors.white,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  bool get badEnter {
    return user.name.title.replaceAll(" ", "").isEmpty ||
        user.name.first.replaceAll(" ", "").isEmpty ||
        user.name.last.replaceAll(" ", "").isEmpty ||
        user.phone.replaceAll(" ", "").isEmpty ||
        user.location.country.replaceAll(" ", "").isEmpty ||
        user.location.city.replaceAll(" ", "").isEmpty ||
        user.picture.large.replaceAll(" ", "").isEmpty;
  }

  Future<dynamic> chooseGender(BuildContext context, RxString currentGender) {
    return Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomColumn(children: [
          const Center(
            child: CustomText(
              "Choose gender",
              size: 25,
              weight: FontWeight.bold,
            ),
          ),
          6.h,
          RadioListTile(
            value: User.maleGender,
            groupValue: currentGender.value,
            onChanged: (value) {
              currentGender.value = value as String;
              user.gender = value;
              Routes.back();
            },
            title: const CustomText('Male'),
          ),
          RadioListTile(
            value: User.femaleGender,
            groupValue: currentGender.value,
            onChanged: (value) {
              currentGender.value = value as String;
              user.gender = value;
              Routes.back();
            },
            title: const CustomText('Female'),
          ),
        ]),
      ),
    ));
  }
}
