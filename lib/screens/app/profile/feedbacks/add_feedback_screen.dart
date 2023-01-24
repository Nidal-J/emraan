import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors_manager.dart';

class AddFeedbackScreen extends StatelessWidget {
  const AddFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة ملاحظة'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          children: [
            const TextFieldWidget(
              label: 'اسم الملاحظة',
              hintText: 'اسم الملاحظة',
            ),
            const TextFieldWidget(
              label: 'التفاصيل',
              hintText: 'اكتب هنا ...',
              maxLines: 5,
              minLines: 5,
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
                Get.back();
                showSnackbar(message: 'شكرا لك، تم إضافة ملاحظتك بنجاح');
              },
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
