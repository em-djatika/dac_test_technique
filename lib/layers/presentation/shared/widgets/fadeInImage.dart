// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class EFadeInImage extends StatelessWidget {
  const EFadeInImage({Key? key, required this.image, this.radius})
      : super(key: key);
  final String image;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius == null ? 0 : radius!),
      child: FadeInImage(
          imageErrorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.warning_rounded,
              color: Theme.of(context).primaryColor,
            );
          },
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/icons/placeholder.png'),
          image: NetworkImage(image)),
    );
  }
}
