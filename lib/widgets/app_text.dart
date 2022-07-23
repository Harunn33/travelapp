import 'package:flutter/material.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/constants/strings.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText(
      {Key? key,
      this.size = 2 * AppDimens.horizontal,
      required this.text,
      this.color = AppColors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4?.copyWith(
            color: color,
            fontSize: size,
          ),
      softWrap: true,
    );
  }
}
