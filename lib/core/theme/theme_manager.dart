import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';

class ThemeManager {
  static ThemeData light() {
    return ThemeData(
      fontFamily: ConstantsManager.cairoFontFamily,
      colorScheme: const ColorScheme.light(primary: ColorsManager.primary),
      scaffoldBackgroundColor: ColorsManager.scaffoldBg,
      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60.r),
          ),
          side: BorderSide.none,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: ConstantsManager.cairoFontFamily,
        ),
        elevation: 0,
        foregroundColor: ColorsManager.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        button: TextStyle(
          fontSize: 18.sp,
          fontFamily: ConstantsManager.cairoFontFamily,
        ),
        bodyText2: TextStyle(
          color: ColorsManager.titleColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      dividerColor: ColorsManager.dividerColor,
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantsManager.cairoFontFamily,
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(Get.width, 52.h),
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontFamily: ConstantsManager.cairoFontFamily,
          ),
          foregroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(Get.width, 50.h),
          foregroundColor: ColorsManager.titleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          side: const BorderSide(
            color: ColorsManager.primary,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedLabelStyle:
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStylesManager.subTitle,
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.subtitleColor,
        showUnselectedLabels: true,
      ),
    );
  }
}
