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
        // backgroundColor: Colors.transparent,
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
          // elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(Get.width, 50.h),
          foregroundColor: ColorsManager.titleColor,
          alignment: Alignment.centerRight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          side: const BorderSide(
            color: ColorsManager.primary,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        // type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedLabelStyle:
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        // selectedIconTheme: IconThemeData(size: 30.r),
        // unselectedIconTheme: IconThemeData(size: 24.r),
        unselectedLabelStyle: TextStylesManager.subTitle,
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.subtitleColor,
        showUnselectedLabels: true,
      ),
    );
  }
  // static ThemeData dark() {
  //   return ThemeData.dark().copyWith(
  //     scaffoldBackgroundColor: ColorsManager.scaffoldBg,
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         fixedSize: Size(Get.width, 100.h),
  //         textStyle: TextStyle(
  //           fontSize: 26.sp,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         backgroundColor: ColorsManager.purble,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(100.r),
  //         ),
  //       ),
  //     ),
  //     outlinedButtonTheme: OutlinedButtonThemeData(
  //       style: OutlinedButton.styleFrom(
  //         fixedSize: Size(Get.width / 4, 60.h),
  //         foregroundColor: ColorsManager.danger,
  //         side: const BorderSide(
  //           color: ColorsManager.danger,
  //           width: 2,
  //         ),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(100.r),
  //         ),
  //       ),
  //     ),
  //     textButtonTheme: TextButtonThemeData(
  //       style: TextButton.styleFrom(
  //         textStyle: const TextStyle(
  //           // fontSize: 18.sp,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         foregroundColor: ColorsManager.white,
  //       ),
  //     ),
  //     appBarTheme: AppBarTheme(
  //       centerTitle: true,
  //       titleTextStyle: TextStyle(
  //         fontSize: 30.sp,
  //         fontWeight: FontWeight.w500,
  //         color: ColorsManager.white,
  //       ),
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //     ),
  //     textTheme: TextTheme(
  //       bodyText2: TextStyle(
  //         color: ColorsManager.white,
  //         fontWeight: FontWeight.w500,
  //         fontSize: 28.sp,
  //       ),
  //     ),
  //   );
  // }
}
