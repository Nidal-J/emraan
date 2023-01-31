import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/merchant_app/getx/controllers/merchant_offer_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MerchantOfferDetailsScreen
    extends GetView<MerchantOfferDetailsController> {
  const MerchantOfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كارة جر'),
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('يبدأ العرض بتاريخ'),
                            SizedBox(height: 4.h),
                            Container(
                              height: 48.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: ColorsManager.success.withOpacity(0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        '22/12/2022',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorsManager.success,
                                          fontSize: 10.sp,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        color: ColorsManager.success
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: ColorsManager.success
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.date_range_rounded,
                                        color: ColorsManager.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ينتهي العرض بتاريخ'),
                            SizedBox(height: 4.h),
                            Container(
                              height: 48.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: ColorsManager.danger.withOpacity(0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        '30/12/2022',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorsManager.danger,
                                          fontSize: 10.sp,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        color: ColorsManager.danger
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: ColorsManager.danger
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.date_range_rounded,
                                        color: ColorsManager.white,
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
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('تعديل العرض'),
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
                          child: const Text('حذف العرض'),
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
