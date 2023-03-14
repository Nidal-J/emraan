import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../getx/controllers/payment_controller.dart';

class PaymentPay extends GetView<PaymentController> {
  const PaymentPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('حدد طريقة الدفع'),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => controller.cardIndex.value = index,
              child: ProfileCardWidget(
                child: index == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('المحفظة'),
                          RichText(
                            text: TextSpan(
                              text: '900',
                              style: TextStyle(
                                color: ColorsManager.primary,
                                fontSize: 18.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: ' ر.س',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          Obx(() => CircleAvatar(
                                radius: 13.r,
                                backgroundColor: ColorsManager.dividerColor,
                                child: CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor:
                                      controller.cardIndex.value == index
                                          ? ColorsManager.success
                                          : ColorsManager.cardColor,
                                ),
                              )),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: SvgPicture.asset(
                              ImagesManager.masterCard,
                              fit: BoxFit.none,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              'Mohamed Ali',
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0000000*****',
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.cardIndex.value = index,
                            child: Obx(() => CircleAvatar(
                                  radius: 13.r,
                                  backgroundColor: ColorsManager.dividerColor,
                                  child: CircleAvatar(
                                    radius: 12.r,
                                    backgroundColor:
                                        controller.cardIndex.value == index
                                            ? ColorsManager.success
                                            : ColorsManager.cardColor,
                                  ),
                                )),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.bottomLeft,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              fixedSize: Size(Get.width / 3, 46.h),
              foregroundColor: ColorsManager.primary,
              alignment: Alignment.center,
            ),
            child: Text(
              'إضافة بطاقة',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
