import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/merchant_app/merchant_product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MerchantProductDetailsScreen
    extends GetView<MerchantProductDetailsController> {
  const MerchantProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خزان مياه بسعة 2000 لتر'),
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
                    controller: controller.bannerController,
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
                            // fit: BoxFit.contain,
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
                    onTap: () {
                      controller.bannerController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'السعة',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 40.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(width: 10.w);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: EdgeInsets.all(4.r),
                                    constraints: BoxConstraints(
                                      minHeight: 40.r,
                                      minWidth: 40.r,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(
                                          color: ColorsManager.subtitleColor),
                                      color: ColorsManager.white,
                                    ),
                                    child: Text(
                                      '${index + 1}000\nلتر',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsManager.subtitleColor,
                                        fontSize: 10.sp,
                                        height: 1.2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'الكمية المتوفرة',
                              style: TextStyle(fontSize: 24.sp),
                            ),
                            Container(
                              height: 40.h,
                              width: 40.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: ColorsManager.cardColor,
                              ),
                              child: Text(
                                '85',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsManager.subtitleColor,
                                  fontSize: 24.sp,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('تعديل المنتج'),
                        ),
                      ),
                      SizedBox(width: 28.w),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ColorsManager.iconsColor,
                            side: const BorderSide(
                                color: ColorsManager.iconsColor),
                          ),
                          child: const Text('حذف المنتج'),
                        ),
                      ),
                    ],
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
