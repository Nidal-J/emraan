import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../routes/routes_manager.dart';
import '../../../../widgets/customer_profile_card_widget.dart';
import '../../../../widgets/top_right_radius.dart';

class CustomerFeedbacksScreen extends StatelessWidget {
  const CustomerFeedbacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملاحظات المستخدمين'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () =>
                    Get.toNamed(RoutesManager.customerAddFeedbackScreen),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width * 0.4, 46.h),
                ),
                child: const Text('إضافة ملاحظة'),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Get.toNamed(
                          RoutesManager.customerFeedbackDetailsScreen),
                      child: CustomerProfileCardWidget(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'اسم الملاحظة الملاحظة الملاحظة الملاحظة',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 2.h),
                              constraints: BoxConstraints(minWidth: 60.w),
                              decoration: BoxDecoration(
                                color: ColorsManager.danger.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'تحت المراجعة',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              '20/12/2022',
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              icon: const Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
