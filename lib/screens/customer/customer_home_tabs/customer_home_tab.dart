import 'dart:developer';
import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/constants_manager.dart';
import '../../../getx/controllers/customer/customer_home_controller.dart';
import '../../../widgets/customer_category_card_widget.dart';
import '../../../widgets/product_card_widget.dart';

class CustomerHomeTab extends StatelessWidget {
  const CustomerHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 18.h, right: 10.w),
      children: [
        // العروض
        SizedBox(
          height: 226.h, // 21 + 10 + 160 + 35
          child: Stack(
            children: [
              Row(
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'العروض',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(20.w, 30.h, 10.w, 35.h),
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 6.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              Get.toNamed(RoutesManager.productDetailsScreen),
                          child: ProductCard(
                            storeName: 'اسم المتجر',
                            productDescription: 'خزان مياه حجم 2000لتر',
                            originPrice: 500,
                            offerPrice: 300,
                            imageUrl: ImagesManager.products[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 12,
                child: InkWell(
                  onTap: () => Get.toNamed(RoutesManager.offersScreen),
                  child: Container(
                    height: 22.r,
                    width: 22.r,
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
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
              Row(
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'الفئات',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(20.w, 26.h, 10.w, 35.h),
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 6.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              Get.toNamed(RoutesManager.categoriesScreen),
                          child: CustomerCategoryCardWidget(
                            image: ImagesManager.categories[index],
                            title: 'اسمنت',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 12,
                child: InkWell(
                  onTap: () {
                    log('message');
                    Get.toNamed(RoutesManager.categoriesScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Text(
                      'المزيد',
                      style: TextStyle(fontSize: 10.sp),
                    ),
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
              Row(
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'المتاجر',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(20.w, 26.h, 10.w, 35.h),
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 6.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => Get.toNamed(RoutesManager.storeScreen),
                          child: const CustomerCategoryCardWidget(
                            image: ImagesManager.logo2,
                            title: 'اسم المتجر',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 12,
                child: InkWell(
                  onTap: () => CustomerHomeController().pageIndex(1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Text(
                      'المزيد',
                      style: TextStyle(fontSize: 10.sp),
                    ),
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
