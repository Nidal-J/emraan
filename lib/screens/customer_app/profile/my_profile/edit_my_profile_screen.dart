import 'package:emraan/core/theme/theme_manager.dart';
import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../../../core/widgets/text_field_widget.dart';

class EditMyProfileScreen extends StatelessWidget {
  const EditMyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('تعديل الملف الشخصي'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            children: [
              TextFieldWidget(
                label: 'الإسم بالكامل',
                hintText: 'الإسم بالكامل',
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorsManager.subtitleColor,
                  size: 26.r,
                ),
              ),
              SizedBox(height: 10.h),
              const TextFieldWidget(
                label: 'الإيميل',
                hintText: 'example@example.com',
                isEmail: true,
              ),
              SizedBox(height: 10.h),
              const TextFieldWidget(
                label: 'رقم الجوال',
                hintText: '*********',
                isPhone: true,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary.withOpacity(0.5),
                  foregroundColor: ColorsManager.black,
                  elevation: 0,
                ),
                child: const Text('استيراد  صورة شخصية'),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Get.offNamedUntil(RoutesManager.homeScreen, (route) => false);
                  showSnackbar(message: 'تم تعديل الملف الشخصي بنجاح');
                },
                child: const Text('تأكيد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
