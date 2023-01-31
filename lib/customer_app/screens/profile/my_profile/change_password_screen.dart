import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../auth/getx/controllers/change_password_controller.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/widgets/text_field_widget.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تغيير كلمة المرور'),
      ),
      body: TopRightRadius(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
            child: Column(
              children: [
                Obx(() => TextFieldWidget(
                      label: 'كلمة المرور القديمة',
                      hintText: '*********',
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.oldPasswordVisible.toggle();
                        },
                        icon: controller.oldPasswordVisible.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              ),
                      ),
                      obscureText: !controller.oldPasswordVisible.value,
                      controller: controller.oldPasswordController,
                      isPassword: true,
                    )),
                SizedBox(height: 10.h),
                Obx(() => TextFieldWidget(
                      label: 'كلمة المرور الجديدة',
                      hintText: '*********',
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.newPasswordVisible.toggle();
                        },
                        icon: controller.newPasswordVisible.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: ColorsManager.subtitleColor,
                                size: 24.h,
                              ),
                      ),
                      obscureText: !controller.newPasswordVisible.value,
                      controller: controller.newPasswordController,
                      isPassword: true,
                    )),
                SizedBox(height: 10.h),
                Obx(
                  () => TextFieldWidget(
                    label: 'تأكيد كلمة المرور الجديدة',
                    hintText: '*********',
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.confirmPasswordVisible.toggle();
                      },
                      icon: controller.confirmPasswordVisible.value
                          ? Icon(
                              Icons.visibility_outlined,
                              color: ColorsManager.subtitleColor,
                              size: 24.h,
                            )
                          : Icon(
                              Icons.visibility_off_outlined,
                              color: ColorsManager.subtitleColor,
                              size: 24.h,
                            ),
                    ),
                    obscureText: !controller.confirmPasswordVisible.value,
                    controller: controller.confirmNewPasswordController,
                    isPassword: true,
                  ),
                ),
                SizedBox(height: 28.h),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      _performChangePassword();
                    }
                  },
                  child: const Text('تأكيد'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _performChangePassword() {}
}
