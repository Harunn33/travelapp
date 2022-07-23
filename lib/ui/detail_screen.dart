import 'package:flutter/material.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/constants/sizedBox.dart';
import 'package:travelapp/constants/strings.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/custom_image.dart';
import 'package:travelapp/widgets/liked_button.dart';
import 'package:travelapp/widgets/responsive_button.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int gottenStars = 3;
  int currentIndex = -1;

  void _onNumItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _starsTapped(int index) {
    setState(() {
      gottenStars = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 23 * AppDimens.vertical + 5,
                decoration: BoxDecoration(
                  image: customImage(path: "mountain.jpeg"),
                ),
              ),
            ),
            TopIconRow(),
            Positioned(
              top: 21 * AppDimens.horizontal,
              child: Container(
                padding: EdgeInsets.only(
                  left: 2 * AppDimens.horizontal - 5,
                  right: 2 * AppDimens.horizontal - 5,
                  top: 2 * AppDimens.horizontal,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(3 * AppDimens.vertical - 5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    sizedBoxH.sizedBox10,
                    Location(),
                    sizedBoxH.sizedBox5,
                    Rating(),
                    sizedBoxH.sizedBox20,
                    AppLargeText(
                      text: AppStrings.detailNumTitle,
                      size: AppDimens.horizontal + 5,
                    ),
                    sizedBoxH.sizedBox5,
                    AppText(
                      text: AppStrings.detailNumSubtitle,
                      size: AppDimens.horizontal - 2,
                      color: AppColors.textColor2,
                    ),
                    sizedBoxH.sizedBox10,
                    NumButton(),
                    sizedBoxH.sizedBox20,
                    AppLargeText(
                      text: AppStrings.detailDescriptionTitle,
                      size: AppDimens.horizontal + 5,
                    ),
                    sizedBoxH.sizedBox5,
                    AppText(
                      text: AppStrings.detailDescriptionSubtitle,
                      size: AppDimens.horizontal,
                      color: AppColors.textColor2,
                    ),
                    sizedBoxH.sizedBox20,
                    ButtonRow(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Wrap NumButton() {
    return Wrap(
      spacing: AppDimens.horizontal - 5,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () {
            _onNumItemTapped(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.black
                  : AppColors.buttonBackground,
              borderRadius: BorderRadius.circular(AppDimens.horizontal),
            ),
            width: 4 * AppDimens.horizontal,
            height: 4 * AppDimens.vertical,
            child: Center(
              child: AppText(
                text: (index + 1).toString(),
                color:
                    currentIndex == index ? AppColors.white : AppColors.black,
                size: AppDimens.horizontal + 5,
              ),
            ),
          ),
        );
      }),
    );
  }

  Row Rating() {
    return Row(
      children: [
        Wrap(
          children: List.generate(5, (index) {
            return Container(
              width: AppDimens.horizontal + 5,
              child: IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 15),
                iconSize: AppDimens.horizontal + 5,
                onPressed: () {
                  _starsTapped(index + 1);
                },
                icon: Icon(
                  gottenStars > index ? Icons.star : Icons.star_outline,
                  color: gottenStars > index
                      ? AppColors.starColor
                      : AppColors.black.withOpacity(.2),
                ),
              ),
            );
          }),
        ),
        sizedBoxW.sizedBox10,
        AppText(
          text: "(${gottenStars.toDouble()})",
          color: AppColors.textColor2,
          size: AppDimens.horizontal,
        )
      ],
    );
  }
}

class TopIconRow extends StatelessWidget {
  const TopIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4 * AppDimens.vertical,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.horizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 2 * AppDimens.horizontal,
                color: AppColors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                size: 2 * AppDimens.horizontal,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 4 * AppDimens.vertical,
            child: LikedButton(),
          ),
        ),
        sizedBoxW.sizedBox20,
        Expanded(
          flex: 8,
          child: Container(
            height: 4 * AppDimens.vertical,
            child: ResponsiveButton(
              text: AppStrings.detailBtnText,
            ),
          ),
        ),
      ],
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.mainColor,
        ),
        sizedBoxW.sizedBox5,
        AppText(
          text: AppStrings.detailLocation,
          size: AppDimens.horizontal,
          color: AppColors.textColor1,
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLargeText(
          text: AppStrings.detailTitle,
          size: 2 * AppDimens.horizontal - 5,
        ),
        AppLargeText(
          text: AppStrings.detailPrice,
          size: 2 * AppDimens.horizontal - 5,
          color: AppColors.mainColor,
        ),
      ],
    );
  }
}
