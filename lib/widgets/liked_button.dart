import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/ui/navui/main_screen.dart';

class LikedButton extends StatefulWidget {
  const LikedButton({Key? key}) : super(key: key);

  @override
  State<LikedButton> createState() => _LikedButtonState();
}

class _LikedButtonState extends State<LikedButton> {
  bool isLike = false;
  void _like() {
    setState(() {
      isLike = !isLike;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      constraints: BoxConstraints(minHeight: 4 * AppDimens.horizontal),
      child: OutlinedButton(
        onPressed: () {
          _like();
        },
        child: Icon(
          isLike == true ? Icons.favorite : Icons.favorite_border_outlined,
          color: AppColors.mainColor,
        ),
        style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.white,
            splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
