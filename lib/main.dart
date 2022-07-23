import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/cubit/app_cubit_logics.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/ui/detail_screen.dart';
import 'package:travelapp/ui/home_screen.dart';
import 'package:travelapp/ui/navui/main_screen.dart';
import 'package:travelapp/ui/navui/search_screen.dart';
import 'package:travelapp/ui/splash_screen.dart';
import 'package:get/get.dart';
import 'package:travelapp/widgets/liked_button.dart';
import 'package:travelapp/widgets/responsive_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: AppColors.mainColor.withOpacity(.5),
            unselectedIconTheme: IconThemeData(size: 1.6 * AppDimens.vertical),
            selectedIconTheme: IconThemeData(size: 2 * AppDimens.vertical),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
          )),
      home: BlocProvider(
        create: (context) => AppCubits(),
        child: AppCubitLogics(),
      ),
    );
  }
}
