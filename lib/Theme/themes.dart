
import 'package:astro_tak/AppManager/app_color.dart';
import 'package:flutter/material.dart';


class Themes {
  static final light = ThemeData.light().copyWith(

    backgroundColor: AppColor.bgColor,
    primaryColor: AppColor.primaryColor,
    secondaryHeaderColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.bgColor,
    shadowColor: Colors.transparent
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}