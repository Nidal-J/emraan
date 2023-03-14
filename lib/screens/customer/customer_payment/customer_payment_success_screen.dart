import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors_manager.dart';
import '../../../getx/controllers/customer/customer_home_controller.dart';
import '../../../getx/controllers/customer/customer_payment_controller.dart';

class CustomerPaymentSuccessScreen extends GetView<CustomerPaymentController> {
  const CustomerPaymentSuccessScreen({super.key});

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
                  CustomerHomeController().pageIndex(0);
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
