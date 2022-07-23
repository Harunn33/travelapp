import 'package:flutter/material.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/constants/strings.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/" + images[index]),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SplashScreenTexts(),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: AppDimens.vertical - 10),
                          child: Container(
                            height: index == indexDots
                                ? 2 * AppDimens.vertical - 8
                                : AppDimens.vertical - 7,
                            width: AppDimens.vertical - 7,
                            decoration: BoxDecoration(
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(.4),
                              borderRadius:
                                  BorderRadius.circular(AppDimens.vertical - 7),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class SplashScreenTexts extends StatelessWidget {
  const SplashScreenTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLargeText(
          text: AppStrings.splashScreenTitle,
        ),
        AppText(
          text: AppStrings.splashScreenTitle2,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: AppDimens.vertical + 5, bottom: 2 * AppDimens.vertical + 10),
          child: Container(
            width: 16 * AppDimens.horizontal + 10,
            child: AppText(
              text: AppStrings.splashScreenSubtitle,
              size: AppDimens.vertical - 1,
              color: AppColors.textColor2,
            ),
          ),
        ),
        ResponsiveButton(),
      ],
    );
  }
}
