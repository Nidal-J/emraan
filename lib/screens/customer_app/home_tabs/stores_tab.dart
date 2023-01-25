import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors_manager.dart';
import '../../../core/constants/images_manager.dart';

class StoresTab extends StatelessWidget {
  const StoresTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 14.w,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 9,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.toNamed(RoutesManager.storeScreen),
          child: Container(
            height: 102.h,
            width: 108.w,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: ConstantsManager.customBoxShadow20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesManager.logo,
                  color: ColorsManager.primary,
                  height: 56.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 4.h),
                Text(
                  'اسم المتجر',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
