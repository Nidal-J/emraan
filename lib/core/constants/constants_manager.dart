import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';
import 'images_manager.dart';

class ConstantsManager {
  static const String cairoFontFamily = 'Cairo';
  static AppBar authAppBar = AppBar(
    title: Image.asset(
      ImagesManager.logo,
      width: 90.w,
    ),
    toolbarHeight: 150.h,
  );

  static const List<BoxShadow> customBoxShadow20 = [
    BoxShadow(
      color: ColorsManager.shadow2,
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 4),
    ),
  ];
  static const List<BoxShadow> customBoxShadow10 = [
    BoxShadow(
      color: ColorsManager.shadow1,
      blurRadius: 10,
      offset: Offset(0, 0),
    ),
  ];
}
