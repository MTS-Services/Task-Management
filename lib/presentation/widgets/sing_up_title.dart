import 'package:flutter/material.dart';

import '../../domain/entities/color.dart';

class SingUpAndTitle extends StatelessWidget {
  const SingUpAndTitle({
    super.key, required this.title, required this.title2,
  });
  final String title;
  final String  title2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title2,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: RColors.smallFontColor),
        ),
      ],
    );
  }
}