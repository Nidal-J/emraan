import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/getx/controllers/app/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';

class PaymentAddress extends GetView<PaymentController> {
  const PaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primary.withOpacity(0.5),
            foregroundColor: ColorsManager.black,
          ),
          child: const Text('استيراد  صورة موقع التنزيل'),
        ),
        Text(
          'الحد الأقصى لارفاق الصور عدد 5',
          style: TextStyle(fontSize: 10.sp),
        ),
        SizedBox(height: 16.h),
        const TextFieldWidget(
          label: 'رقم طابق التنزيل',
          hintText: '00',
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsManager.cardColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'شارع العليا، العليا، Al akaria #2, 5th floor, الرياض 11564، المملكة العربية السعودية',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: () => controller.cardIndex.value = index,
                    child: Obx(() => CircleAvatar(
                          radius: 13.r,
                          backgroundColor: ColorsManager.dividerColor,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: controller.cardIndex.value == index
                                ? ColorsManager.success
                                : ColorsManager.cardColor,
                          ),
                        )),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primary.withOpacity(0.5),
            foregroundColor: ColorsManager.black,
          ),
          child: const Text('عنوان آخر'),
        ),
      ],
    );
  }
}
