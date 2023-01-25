import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/customer_app/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/text_field_widget.dart';

class AddPaymentCardScreen extends GetView<PaymentController> {
  const AddPaymentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة بطاقة جديدة'),
      ),
      body: TopRightRadius(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
            children: [
              TextFieldWidget(
                label: 'الإسم على البطاقة',
                hintText: 'الإسم على البطاقة',
                controller: controller.holderNameController,
              ),
              SizedBox(height: 10.h),
              TextFieldWidget(
                label: 'رقم البطاقة',
                hintText: '0000000000000000',
                controller: controller.cardNumberController,
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: TextFieldWidget(
                      label: 'تاريخ الانتهاء',
                      hintText: '00/00/0000',
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFieldWidget(
                        label: 'CVV',
                        hintText: '000',
                        controller: controller.cvvController,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    _performAddNewCard();
                  }
                },
                child: const Text('تأكيد'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performAddNewCard() async {
    Get.back();
    showSnackbar(message: 'تم إضافة البطاقة بنجاح');
  }
}
