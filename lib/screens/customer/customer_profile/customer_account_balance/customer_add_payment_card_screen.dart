import 'package:emraan/utils/show_snackbar.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../getx/controllers/customer/customer_payment_controller.dart';
import '../../../../widgets/text_field_widget.dart';

class CustomerAddPaymentCardScreen extends GetView<CustomerPaymentController> {
  const CustomerAddPaymentCardScreen({super.key});

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
                keyboardType: const TextInputType.numberWithOptions(),
                maxLength: 20,
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'تاريخ الانتهاء',
                      hintText: '00/00/0000',
                      readOnly: true,
                      controller: controller.expDateController,
                      onTap: () async {
                        _performPickDate(context);
                      },
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
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 3,
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

  _performAddNewCard() async {
    Get.back();
    showSnackbar(message: 'تم إضافة البطاقة بنجاح');
  }

  Future<bool> _performPickDate(BuildContext context) async {
    bool isSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      keyboardType: TextInputType.datetime,
    ).then((value) {
      value != null ? controller.expDate(value) : null;
      return value != null;
    }).catchError((e) => false);

    if (isSelected) {
      controller.expDateController.text =
          '${controller.expDate.value.day}/${controller.expDate.value.month}/${controller.expDate.value.year}';
    }

    return isSelected;
  }
}
