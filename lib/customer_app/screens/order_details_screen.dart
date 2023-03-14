import '../../core/constants/text_styles_manager.dart';
import '../../core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/widgets/bill_option.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#1122'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(Get.width / 3, 46.h),
                  foregroundColor: ColorsManager.subtitleColor,
                  alignment: Alignment.center,
                ),
                child: Text(
                  'إلغاء الطلب',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ),
            Text(
              'المنتجات',
              style: TextStylesManager.title.copyWith(height: 1),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: ColorsManager.cardColor,
                    boxShadow: ConstantsManager.customBoxShadow20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: ColorsManager.white,
                        ),
                        child: Image.asset(
                          ImagesManager.products[2],
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(14.r),
                          child: Row(
                            children: [
                              Text(
                                '#1225',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '500',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorsManager.primary,
                                ),
                              ),
                              Text(
                                'ر.س',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  color: ColorsManager.primary,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            Text(
              'الفاتورة',
              style: TextStylesManager.title,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsManager.cardColor,
                boxShadow: ConstantsManager.customBoxShadow10,
              ),
              child: Column(
                children: const [
                  BillOption(title: 'التوصيل', price: '00'),
                  BillOption(title: 'السعر قبل التخفيض', price: '900'),
                  BillOption(title: 'التخفيض', price: '00'),
                  BillOption(title: 'السعر بعد التخفيض', price: '900'),
                  BillOption(title: 'الضريبة', price: '20'),
                  Divider(),
                  BillOption(
                    title: 'مبلغ النهائي للدفع',
                    price: '920',
                    finalPrice: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'طريقة الدفع',
              style: TextStylesManager.title,
            ),
          ],
        ),
      ),
    );
  }
}
