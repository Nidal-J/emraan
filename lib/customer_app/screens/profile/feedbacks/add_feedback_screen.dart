import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../getx/controllers/add_feedback_controller.dart';

class AddFeedbackScreen extends GetView<AddFeedbackController> {
  const AddFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة ملاحظة'),
      ),
      body: TopRightRadius(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
            physics: const BouncingScrollPhysics(),
            children: [
              TextFieldWidget(
                label: 'اسم الملاحظة',
                hintText: 'اسم الملاحظة',
                controller: controller.noteTitleController,
              ),
              TextFieldWidget(
                label: 'التفاصيل',
                hintText: 'اكتب هنا ...',
                controller: controller.noteDetailsController,
                multiLines: true,
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary.withOpacity(0.5),
                  foregroundColor: ColorsManager.black,
                  elevation: 0,
                ),
                child: const Text('استيراد  صورة'),
              ),
              Text(
                'الحد الأقصى لارفاق الصور عدد 5',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    _performAddNote();
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

  void _performAddNote() {
    Get.back();
    showSnackbar(message: 'شكرا لك، تم إضافة ملاحظتك بنجاح');
  }
}
