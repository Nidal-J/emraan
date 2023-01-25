import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../../../core/constants/images_manager.dart';
import '../../../../core/routes/routes_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const List<String> _listTitles = [
    'عنواننا',
    'عن التطبيق',
    'سياسة الخصوصية',
  ];

  static final List<void Function()?> _listActions = [
    () => Get.toNamed(RoutesManager.ourAddressScreen),
    () => Get.toNamed(RoutesManager.aboutUsScreen),
    () => Get.toNamed(RoutesManager.privacyPolicyScreen),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادت'),
      ),
      body: TopRightRadius(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: _listActions[index],
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
                      ImagesManager.settingsIcons[index],
                    ),
                    SizedBox(width: 32.w),
                    Text(_listTitles[index]),
                    const Spacer(),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20.r,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
