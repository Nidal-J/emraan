import 'dart:developer';
import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/utils/show_logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/show_snackbar.dart';
import '../../getx/controllers/home_controller.dart';

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
            (index) => InkWell(
              onTap: index == 9
                  ? () => _performLogout(context)
                  : _listActions[index],
              child: Container(
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
                    index > 5 && index < 9
                        ? SvgPicture.asset(
                            ImagesManager.abroad,
                          )
                        : Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.r,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _performLogout(BuildContext context) {
    showLogoutDialog(
      message: 'أنت على وشك تسجيل الخروج! هل تريد الإستمرار؟',
      context: context,
      onConfirm: () async {
        Get.back();
        HomeController().isLoading(true);
        // TODO: Replace with API request
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(RoutesManager.loginScreen);
        HomeController().isLoading(false);
        HomeController().pageIndex(0);
        showSnackbar(message: 'تم تسجيل الخروج بنجاح');
      },
    );
  }
}
