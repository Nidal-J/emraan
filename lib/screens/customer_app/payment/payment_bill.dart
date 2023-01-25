import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:emraan/getx/controllers/customer_app/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../core/constants/constants_manager.dart';
import '../../../core/widgets/bill_option.dart';

class PaymentBill extends GetView<PaymentController> {
  const PaymentBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProfileCardWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('سعر المنتجات'),
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
            ],
          ),
        ),
        SizedBox(height: 14.h),
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
      ],
    );
  }
}
