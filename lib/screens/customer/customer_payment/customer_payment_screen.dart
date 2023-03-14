import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:emraan/screens/customer/customer_payment/customer_payment_address.dart';
import 'package:emraan/screens/customer/customer_payment/customer_payment_bill.dart';
import 'package:emraan/screens/customer/customer_payment/customer_payment_pay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors_manager.dart';
import '../../../getx/controllers/customer/customer_payment_controller.dart';

class CustomerPaymentScreen extends GetView<CustomerPaymentController> {
  const CustomerPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.progressIndex.value == 0) {
          return true;
        } else {
          controller.progressIndex.value--;
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('الدفع'),
        ),
        body: TopRightRadius(
          child: Obx(
            () => ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _PaymentProgress(
                        index: 0,
                        title: 'العنوان',
                        image: ImagesManager.address),
                    _PaymentProgress(
                        index: 1, title: 'الفاتورة', image: ImagesManager.bill),
                    _PaymentProgress(
                        index: 2, title: 'الدفع', image: ImagesManager.payment),
                  ],
                ),
                SizedBox(height: 26.h),
                controller.progressIndex.value == 0
                    ? const CustomerPaymentAddress()
                    : controller.progressIndex.value == 1
                        ? const CustomerPaymentBill()
                        : const CustomerPaymentPay(),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {
                    if (controller.progressIndex.value == 2) {
                      Get.offNamedUntil(
                          RoutesManager.paymentSuccessScreen,
                          (route) =>
                              route.settings.name == RoutesManager.homeScreen);
                    } else {
                      controller.progressIndex.value++;
                    }
                  },
                  child: const Text('التالي'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentProgress extends GetView<CustomerPaymentController> {
  const _PaymentProgress({
    Key? key,
    required this.index,
    required this.title,
    required this.image,
  }) : super(key: key);

  final int index;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 42.r,
            width: 42.r,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: controller.progressIndex.value >= index
                    ? ColorsManager.primary
                    : ColorsManager.iconsColor,
                width: 1,
              ),
            ),
            child: SvgPicture.asset(
              image,
              color: controller.progressIndex.value >= index
                  ? ColorsManager.primary
                  : ColorsManager.iconsColor,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: controller.progressIndex.value >= index
                  ? ColorsManager.primary
                  : ColorsManager.iconsColor,
            ),
          ),
        ],
      ),
    );
  }
}
