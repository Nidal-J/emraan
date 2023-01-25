import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/customer_app/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/routes/routes_manager.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#1122'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RoutesManager.cartScreen);
            },
            padding: EdgeInsets.only(left: 28.w),
            color: ColorsManager.iconsColor,
            iconSize: 20.r,
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.only(bottom: 24.h),
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.width,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      controller.bannerIndex(index);
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width,
                        height: 180.h,
                        margin: EdgeInsets.only(bottom: 30.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.r)),
                          color: ColorsManager.white,
                          boxShadow: ConstantsManager.customBoxShadow20,
                          image: DecorationImage(
                            image: AssetImage(ImagesManager.products[2]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 44,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => InkWell(
                        onTap: () => controller.bannerIndex(index),
                        child: Obx(
                          () => Container(
                            height: 13.r,
                            width: 13.r,
                            margin:
                                EdgeInsets.only(right: index != 0 ? 10.w : 0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: controller.bannerIndex.value == index
                                  ? const Border.fromBorderSide(BorderSide.none)
                                  : Border.all(color: ColorsManager.iconsColor),
                              color: controller.bannerIndex.value == index
                                  ? ColorsManager.primary
                                  : ColorsManager.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: ColorsManager.iconsColor,
                      size: 36.r,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 14,
                  child: InkWell(
                    onTap: () {},
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'متجر الدابي',
                    style: TextStylesManager.subTitle,
                  ),
                  Row(
                    children: [
                      Text(
                        'خزان مياه',
                        style: TextStylesManager.title,
                      ),
                      const Spacer(),
                      Text(
                        '450',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorsManager.subtitleColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        ' ر.س',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorsManager.subtitleColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '400',
                        style: TextStyle(
                            fontSize: 18.sp, color: ColorsManager.primary),
                      ),
                      Text(
                        ' ر.س',
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorsManager.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                    style: TextStyle(
                        fontSize: 12.sp, color: ColorsManager.subtitleColor),
                  ),
                  Text(
                    'السعة',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => controller.typeIndex(index),
                          child: Obx(
                            () => Container(
                              padding: EdgeInsets.all(4.r),
                              constraints: BoxConstraints(
                                minHeight: 40.r,
                                minWidth: 40.r,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: controller.typeIndex.value == index
                                    ? const Border.fromBorderSide(
                                        BorderSide.none)
                                    : Border.all(
                                        color: ColorsManager.subtitleColor),
                                color: controller.typeIndex.value == index
                                    ? ColorsManager.primary
                                    : ColorsManager.white,
                              ),
                              child: Text(
                                '3000\nلتر',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: controller.typeIndex.value == index
                                      ? ColorsManager.white
                                      : ColorsManager.subtitleColor,
                                  fontSize: 10.sp,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Obx(
                    () => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.addFocusNode.requestFocus();
                            if (controller.counter.value < 10) {
                              controller.counter.value++;
                            }
                          },
                          focusNode: controller.addFocusNode,
                          child: Container(
                            height: 40.r,
                            width: 40.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.addFocusNode.hasFocus
                                        ? ColorsManager.success
                                        : ColorsManager.diabled)),
                            child: Icon(
                              Icons.add,
                              color: controller.addFocusNode.hasFocus
                                  ? ColorsManager.success
                                  : ColorsManager.diabled,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            controller.counter.value.toString(),
                            style: TextStylesManager.title,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.minusFocusNode.requestFocus();
                            if (controller.counter.value > 1) {
                              controller.counter.value--;
                            }
                          },
                          focusNode: controller.minusFocusNode,
                          child: Container(
                            height: 40.r,
                            width: 40.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.minusFocusNode.hasFocus
                                        ? ColorsManager.success
                                        : ColorsManager.diabled)),
                            child: Icon(
                              Icons.remove,
                              color: controller.minusFocusNode.hasFocus
                                  ? ColorsManager.success
                                  : ColorsManager.diabled,
                            ),
                          ),
                        ),
                        SizedBox(width: 32.w),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Text(
                              'إضافة إلى السلة   ',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            label: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 20.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
