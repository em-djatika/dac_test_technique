
import 'package:flutter/cupertino.dart';
import 'package:test_technique/layers/presentation/shared/others/export.dart';


class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: Colors.transparent,
      child: Row(
        children: [
          _ItemPhoto(user: user),
          // 6.w,
          _ItemDecription(user: user)
        ],
      ),
    );
  }
}

class _ItemDecription extends StatelessWidget {
  const _ItemDecription({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: CustomColumn(
        children: [
          SizedBox(
            width: Get.width - 165.0,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${user.name.title} ",
                    style:
                        const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                TextSpan(text: "${user.name.first}  "),
                TextSpan(text: user.name.last)
              ]),
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.visible,
              textScaleFactor: .7,
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "${user.dob.age} ",
                  style: TextStyle(
                      fontSize: 19,
                      color: AppColors.purple,
                      fontWeight: FontWeight.w500)),
              const TextSpan(text: "Years"),
            ]),
            maxLines: 1,
            overflow: TextOverflow.visible,
            textScaleFactor: .7,
          ),
          3.h,
          SizedBox(
            width: Get.width - 180,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${user.location.country} ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 68, 255),
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: user.location.city,
                    style: TextStyle(
                        color: AppColors.purple, fontWeight: FontWeight.w600)),
              ]),
              style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              textScaleFactor: .7,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          3.h,
          Row(
            children: [
              const Icon(
                CupertinoIcons.phone_fill,
                size: 19,
                color: Color.fromARGB(255, 255, 110, 14),
              ),
              CustomText(user.phone,
               color: const Color.fromARGB(255, 255, 110, 14,), size: 16),
            ],
          )
        ],
      ),
    );
  }
}

class _ItemPhoto extends StatelessWidget {
  const _ItemPhoto({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Hero(
          tag: user.id!,
          child: SizedBox(
              height: 120,
              width: 120,
              child: EFadeInImage(
                radius: 21,
                image: user.picture.large,
              )),
        ),
        Container(
          height: 12,
          width: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
              // height: 12,
              // width: 12,
              decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: user.dob.age % 2 == 0 ? AppColors.green : AppColors.amber,
          )),
        )
      ],
    );
  }
}
