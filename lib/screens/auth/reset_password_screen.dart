import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../core/widgets/top_right_radius.dart';
import '../../getx/controllers/auth/reset_password_controller.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/widgets/loading_widget.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: ConstantsManager.authAppBar,
          body: TopRightRadius(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    Text(
                      'تعيين كلمة مرور جديدة',
                      style: TextStylesManager.title,
                    ),
                    SizedBox(height: 20.h),
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
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.newPasswordController.text.trim() ==
                              controller.confirmNewPasswordController.text
                                  .trim()) {
                            await _performResetPassword();
                          }
                          showSnackbar(
                              message: 'كلمتا المرور غير متطابقتين',
                              success: false);
                        }
                      },
                      child: const Text('تأكيد'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.isLoading.value,
            child: const LoadingWidget(),
          ),
        ),
      ],
    );
  }

  Future<void> _performResetPassword() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      Get.offAllNamed(RoutesManager.homeScreen);
      showSnackbar(message: 'تم إعادة ضبط كلمة المرور بنجاح');
    });
    controller.isLoading(false);
  }
}
