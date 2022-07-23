import 'package:flutter/material.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:get/get.dart';
import 'package:travelapp/constants/sizedBox.dart';
import 'package:travelapp/ui/navui/main_screen.dart';
import 'package:travelapp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  String text;
  double size;
  Color color;
  ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.text = "",
      this.size = AppDimens.horizontal,
      this.color = AppColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 8 * AppDimens.horizontal + 5,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          primary: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.horizontal - 5),
          ),
        ),
        onPressed: () {
          Get.to(MainScreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: text,
              size: size,
              color: color,
            ),
            Image.asset(
              "assets/images/button-one.png",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
