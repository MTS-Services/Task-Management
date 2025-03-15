import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';

class CustomAppBar extends StatelessWidget {

 const CustomAppBar({
    super.key,
    required this.text,
    required this.images,
    this.onPressed,
  });
  final String text;
  final String images;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: RColors.smallFontColor
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          images,
          width: 70,
        ),
      ],
    );
  }
}



