import 'package:emraan/constants/constants_manager.dart';
import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/colors_manager.dart';

class MerchantPackagesTab extends StatelessWidget {
  const MerchantPackagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 44.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => Get.toNamed(RoutesManager.addPackageScreen),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width * 0.4, 46.h),
            ),
            child: const Text('إضافة بكج'),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
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
                          padding: EdgeInsets.all(8.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                              Row(
                                children: [
                                  Text(
                                    'بناء',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: ColorsManager.subtitleColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => Get.toNamed(RoutesManager
                                        .merchantPackageDetailsScreen),
                                    child: Text(
                                      'تفاصيل البكج ',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 16.r,
                                  ),
                                ],
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
        ],
      ),
    );
  }
}
