import 'package:emraan/constants/colors_manager.dart';
import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/constants/text_styles_manager.dart';
import 'package:emraan/utils/show_toast.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../getx/controllers/customer/customer_product_details_controller.dart';
import '../../../routes/routes_manager.dart';
import '../../../widgets/custom_carousel_widget.dart';

class CustomerProductDetailsScreen
    extends GetView<CustomerProductDetailsController> {
  const CustomerProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#1122'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RoutesManager.customerCartScreen);
            },
            padding: EdgeInsets.symmetric(horizontal: 28.w),
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
            CustomCarouselWidget(
              images: List.generate(3, (index) => ImagesManager.products[2]),
              bannerIndex: controller.bannerIndex,
              bannerController: controller.bannerController,
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
                                '${index + 1}000\nلتر',
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
                            onPressed: () {
                              _performAddToCart(context);
                            },
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

  void _performAddToCart(BuildContext context) {
    showToast(
      context,
      message: 'تمت الإضافة للسلة',
      width: Get.width / 2,
    );
  }
}
