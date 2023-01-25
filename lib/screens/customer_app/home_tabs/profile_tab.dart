import 'dart:developer';
import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  static const List<String> _listTitles = [
    'رصيد الحساب',
    'العنوان',
    'تقييمات الخدمات',
    'ملاحظات المستخدمين',
    'رغباتي',
    'إعدادات',
    'تواصل معنا',
    'مشاركة التطبيق',
    'تقييم التطبيق',
    'تسجيل خروج',
  ];

  static final List<void Function()?> _listActions = [
    () => Get.toNamed(RoutesManager.accountBalanceScreen),
    () => Get.toNamed(RoutesManager.addressScreen),
    () => Get.toNamed(RoutesManager.servicesEvaluationScreen),
    () => Get.toNamed(RoutesManager.feedbacksScreen),
    () => Get.toNamed(RoutesManager.wishListScreen),
    () => Get.toNamed(RoutesManager.settingsScreen),
    () => log('message'),
    () => log('message'),
    () => log('message'),
    () => Get.offAllNamed(RoutesManager.loginScreen),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.r),
      children: [
        InkWell(
          onTap: () => Get.toNamed(RoutesManager.myProfileScreen),
          child: CircleAvatar(
            radius: 54.r,
            backgroundColor: ColorsManager.white,
            child: Image.asset(
              ImagesManager.avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'محمد الحسين',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        Column(
          children: List.generate(
            10,
            (index) => Container(
              padding: EdgeInsets.fromLTRB(12.r, 12.r, 26.r, 12.r),
              margin: EdgeInsets.only(bottom: 6.h),
              decoration: BoxDecoration(
                color: ColorsManager.profileColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImagesManager.profileIcons[index],
                  ),
                  SizedBox(width: 32.w),
                  Text(_listTitles[index]),
                  const Spacer(),
                  InkWell(
                    onTap: _listActions[index],
                    child: index > 5 && index < 9
                        ? SvgPicture.asset(
                            ImagesManager.abroad,
                          )
                        : Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.r,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
