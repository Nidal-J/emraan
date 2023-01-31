import 'dart:developer';

import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../core/widgets/top_right_radius.dart';
import '../getx/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: ConstantsManager.authAppBar,
          body: TopRightRadius(
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.all(20.r),
                children: [
                  Text(
                    'تسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: TextStylesManager.title,
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    label: 'الإيميل',
                    hintText: 'example@example.com',
                    controller: controller.emailController,
                    onChange: (value) {
                      bool x = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      log(x.toString());
                    },
                    isEmail: true,
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => TextFieldWidget(
                      label: 'كلمة المرور',
                      hintText: '*********',
                      suffixIcon: Obx(
                        () => IconButton(
                          onPressed: () {
                            controller.passwordVisible(
                                !controller.passwordVisible.value);
                          },
                          icon: controller.passwordVisible.value
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
                      ),
                      obscureText: !controller.passwordVisible.value,
                      controller: controller.passwordController,
                      isPassword: true,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        log('true');
                        _performLoginWithEmail();
                      }
                    },
                    child: const Text('تسجيل دخول'),
                  ),
                  Visibility(
                    visible: true,
                    replacement: SizedBox(height: 16.h),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesManager.forgetPasswordScreen);
                      },
                      child: const Text('نسيت كلمة المرور؟'),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'أو عبر',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  OutlinedButton.icon(
                    onPressed: () {
                      _performLoginWithApple();
                    },
                    style: OutlinedButton.styleFrom(
                      alignment: Alignment.centerRight,
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Image.asset(
                        ImagesManager.apple,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 24.h,
                      ),
                    ),
                    label: Text(
                      'دخول عبر',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  OutlinedButton.icon(
                    onPressed: () {
                      _performLoginWithGoogle();
                    },
                    style: OutlinedButton.styleFrom(
                      alignment: Alignment.centerRight,
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Image.asset(
                        ImagesManager.google,
                        fit: BoxFit.contain,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                    label: Text(
                      'دخول عبر',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ليس لديك حساب ؟',
                        style: TextStyle(color: Color(0xFFABABAB)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RoutesManager.registerScreen);
                        },
                        child: const Text('مستخدم جديد'),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  OutlinedButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesManager.merchantHomeScreen);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorsManager.primary,
                      alignment: Alignment.center,
                      side: const BorderSide(
                        color: ColorsManager.primary,
                        width: 2,
                      ),
                    ),
                    child: const Text('دخول كتاجر'),
                  ),
                  SizedBox(height: 10.h),
                  OutlinedButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesManager.homeScreen);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorsManager.primary,
                      alignment: Alignment.center,
                      side: const BorderSide(
                        color: ColorsManager.primary,
                        width: 2,
                      ),
                    ),
                    child: const Text('دخول كزائر'),
                  ),
                ],
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

  void _performLoginWithEmail() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      controller.isLoading(false);
      Get.offAllNamed(RoutesManager.homeScreen);
      showSnackbar(message: 'تم تسجيل الدخول بنجاح');
    });
  }

  void _performLoginWithGoogle() async {}
  void _performLoginWithApple() async {}
}
