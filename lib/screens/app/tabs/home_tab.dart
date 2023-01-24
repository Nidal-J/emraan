import 'dart:developer';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/getx/controllers/app/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors_manager.dart';
import '../../../core/constants/constants_manager.dart';
import '../../../core/widgets/product_card_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 18.h, right: 16.w),
      children: [
        // العروض
        SizedBox(
          height: 226.h, // 21 + 10 + 160 + 35
          child: Stack(
            children: [
              ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(20.w, 30.h, 0, 35.h),
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: index != 0 ? 6.w : 0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? const RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'العروض',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : InkWell(
                          onTap: () =>
                              Get.toNamed(RoutesManager.productDetailsScreen),
                          child: ProductCard(
                            productName: 'اسم المتجر',
                            productDescription: 'خزان مياه حجم 2000لتر',
                            originPrice: 500,
                            offerPrice: 300,
                            imageUrl: ImagesManager.products[index],
                          ),
                        );
                },
              ),
              Positioned(
                top: 0,
                left: 20,
                child: InkWell(
                  onTap: () => Get.toNamed(RoutesManager.offersScreen),
                  child: Container(
                    height: 21.r,
                    width: 21.r,
                    decoration: const BoxDecoration(
                      color: ColorsManager.white,
                      shape: BoxShape.circle,
                      boxShadow: ConstantsManager.customBoxShadow10,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: ColorsManager.primary,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // الفئات
        SizedBox(
          height: 163.h, // 16 + 10 + 102 + 35
          child: Stack(
            children: [
              ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(20.w, 26.h, 0, 35.h),
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: index != 0 ? 6.w : 0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? const RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'الفئات',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : InkWell(
                          onTap: () =>
                              Get.toNamed(RoutesManager.categoriesScreen),
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
                                  ImagesManager.categories[index],
                                  height: 56.h,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'اسمنت',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
              Positioned(
                top: 0,
                left: 20,
                child: InkWell(
                  onTap: () {
                    log('message');
                    Get.toNamed(RoutesManager.categoriesScreen);
                  },
                  child: Text(
                    'المزيد',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        // المتاجر
        SizedBox(
          height: 163.h, // 16 + 10 + 102 + 35
          child: Stack(
            children: [
              ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(20.w, 26.h, 0, 35.h),
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: index != 0 ? 6.w : 0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? const RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'المتاجر',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : InkWell(
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
              ),
              Positioned(
                top: 0,
                left: 20,
                child: InkWell(
                  onTap: () => HomeController().pageIndex(1),
                  child: Text(
                    'المزيد',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
