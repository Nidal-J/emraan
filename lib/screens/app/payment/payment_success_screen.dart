import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/app/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';

class PaymentSuccessScreen extends GetView<PaymentController> {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('الدفع'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'تم دفع مبلغ 450 ريال سعودي',
                style: TextStyle(
                  color: ColorsManager.success,
                  fontSize: 20.sp,
                ),
              ),
              const Text('شكرا لك على اهتمامك'),
              const Text('سيتم ارسال لك الفاتورة على ايميلك الخاص'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('رقم الفاتورة '),
                  TextButton(
                    onPressed: () =>
                        Get.toNamed(RoutesManager.orderDetailsScreen),
                    child: const Text('#002211'),
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesManager.homeScreen);
                },
                child: const Text('العودة للرئيسية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
