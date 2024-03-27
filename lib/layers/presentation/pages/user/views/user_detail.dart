import 'package:flutter/cupertino.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UsersController>();
    print(user.id);
    return EScaffold(
      body: CustomColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _CoverCard(user: user),
              _ImageCard(user: user),
            ],
          ),
          9.h,
          CustomText(user.name.title),
          6.h,
          CustomText(
            "${user.name.first}  ${user.name.last}",
            weight: FontWeight.bold,
            maxLines: 2,
            size: 22,
          ),
          12.h,
          GenderIcon(currentGender: user.gender)
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SimpleButton(
            onTap: () {
              _deleteDialog(controller);
            },
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 50.0,
            child: const Icon(CupertinoIcons.trash_fill,
                color: Color.fromARGB(255, 180, 180, 180)),
          ),
          Hero(
            tag: 'float',
            child: SimpleButton(
                width: Get.width - 75,
                color: AppColors.purple,
                onTap: () {
                  Routes.toSetUser(
                    user: user,
                    index: controller.allUser.indexOf(user),
                  );
                },
                child: CustomText(
                  "Edit",
                  color: Colors.white,
                  weight: FontWeight.bold,
                )),
          ),
        ]),
      ),
    );
  }

  Future<dynamic> _deleteDialog(UsersController controller) {
    return Get.dialog(TwoOptionsDialog(
        confirmFunction: () {
          controller.allUser.remove(user);

          database?.delete("Users", where: "id=?", whereArgs: [user.id]);
          Routes.back(number: 2);

          waitAfter(900, () {
            controller.search();
          });
        },
        title: "Suppression",
        body: "Voulez-vous vraiment supprimer cet utilisateur ?"));
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({super.key, required this.user});

  final User user;

  final _imageSize = 130.0;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: user.id!,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 5.0, color: AppColors.purple),
            borderRadius: BorderRadius.circular(54)),
        padding: EdgeInsets.all(6.0),
        child: Container(
            height: _imageSize,
            width: _imageSize,
            child: EFadeInImage(
              radius: 45,
              image: user.picture.large,
            )),
      ),
    );
  }
}

class _CoverCard extends StatelessWidget {
  const _CoverCard({super.key, required this.user});

  final User user;

  final _containerHeight = 160.0;
  final _bottomPadding = 30.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _containerHeight,
          margin: EdgeInsets.only(bottom: _bottomPadding),
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(user.picture.large), fit: BoxFit.cover)),
        ),
        Container(
          height: _containerHeight,
          margin: EdgeInsets.only(bottom: _bottomPadding),
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Color.fromARGB(255, 238, 238, 238),
                Color.fromARGB(62, 238, 238, 238),
              ])),
        ),
      ],
    );
  }
}
