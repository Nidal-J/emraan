import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/text_field_widget.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/images_manager.dart';

class CustomerMyProfileScreen extends StatelessWidget {
  const CustomerMyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110.w,
                    child: TextButton.icon(
                      onPressed: () =>
                          Get.toNamed(RoutesManager.editMyProfileScreen),
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: ColorsManager.subtitleColor,
                      ),
                      label: Text(
                        'تعديل الملف\n الشخصي',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorsManager.subtitleColor,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 54.r,
                    backgroundColor: ColorsManager.white,
                    child: Image.asset(
                      ImagesManager.avatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              TextFieldWidget(
                label: 'الإسم بالكامل',
                hintText: 'الإسم بالكامل',
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorsManager.subtitleColor,
                  size: 26.r,
                ),
                readOnly: true,
                filled: true,
              ),
              SizedBox(height: 10.h),
              const TextFieldWidget(
                label: 'الإيميل',
                hintText: 'example@example.com',
                isEmail: true,
                readOnly: true,
                filled: true,
              ),
              SizedBox(height: 10.h),
              const TextFieldWidget(
                label: 'رقم الجوال',
                hintText: '*********',
                isPhone: true,
                readOnly: true,
                filled: true,
              ),
              SizedBox(height: 42.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesManager.changePasswordScreen);
                },
                child: const Text('تغيير كلمة المرور'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
