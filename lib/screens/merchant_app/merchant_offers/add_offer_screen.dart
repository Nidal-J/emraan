import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/product_card_widget.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة عرض'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('حدد المنتج الذي تريد عليه العرض'),
                  // TextButton(
                  //   onPressed: () {},
                  //   child:
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'المزيد',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorsManager.subtitleColor,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 190.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 6.w);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    storeName: 'اسم المتجر',
                    productDescription: 'خزان مياه حجم 2000لتر',
                    originPrice: 500,
                    offerPrice: 300,
                    imageUrl: ImagesManager.products[index],
                    merchantView: true,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            const TextFieldWidget(
                              label: 'السعر القديم',
                              hintText: '00',
                            ),
                            Container(
                              height: 52.h,
                              width: 70.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorsManager.primary,
                              ),
                              child: const Text(
                                'ر.س',
                                style: TextStyle(color: ColorsManager.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40.w),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            const TextFieldWidget(
                              label: 'السعر الجديد',
                              hintText: '00',
                            ),
                            Container(
                              height: 52.h,
                              width: 70.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorsManager.primary,
                              ),
                              child: const Text(
                                'ر.س',
                                style: TextStyle(color: ColorsManager.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
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
                  SizedBox(height: 50.h),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      showSnackbar(message: 'شكرا لك، تم إضافة عرضك بنجاح');
                    },
                    child: const Text('إضافة العرض'),
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
