import 'package:emraan/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors_manager.dart';
import '../../../core/constants/constants_manager.dart';
import '../../../core/routes/routes_manager.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 12.w,
      ),
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.toNamed(RoutesManager.productsScreen),
          child: Container(
            height: 102.h,
            width: 108.w,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: ConstantsManager.testBoxShadow1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesManager.categories[index],
                  height: 100.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  'اسم الفئة',
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
