import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/images_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('السلة'),
      ),
      body: TopRightRadius(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsManager.cardColor,
                boxShadow: ConstantsManager.customBoxShadow20,
              ),
              child: Row(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
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
                            'برميل',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'متجر الخور',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 130.h,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(left: 20.r),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
          boxShadow: ConstantsManager.customBoxShadow10,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '500',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.success,
                    ),
                  ),
                  const Text(
                    ' ر.س',
                    style: TextStyle(
                      color: ColorsManager.success,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesManager.paymentScreen);
                },
                child: const Text('الدفع'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
