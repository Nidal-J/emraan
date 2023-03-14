import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors_manager.dart';
import '../../constants/constants_manager.dart';
import '../../routes/routes_manager.dart';
import '../../utils/show_snackbar.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/top_right_radius.dart';
import '../../constants/images_manager.dart';
import '../../constants/text_styles_manager.dart';
import '../../getx/controllers/auth/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: ColorsManager.white,
          appBar: ConstantsManager.authAppBar,
          body: TopRightRadius(
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.all(20.r),
                children: [
                  Text(
                    'تسجيل مستخدم جديد',
                    textAlign: TextAlign.center,
                    style: TextStylesManager.title,
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    label: 'الإسم بالكامل',
                    hintText: 'الإسم بالكامل',
                    controller: controller.nameController,
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      size: 26.r,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFieldWidget(
                    label: 'الإيميل',
                    hintText: 'example@example.com',
                    controller: controller.emailController,
                    isEmail: true,
                  ),
                  SizedBox(height: 10.h),
                  TextFieldWidget(
                    label: 'رقم الجوال',
                    hintText: '*********',
                    controller: controller.phoneController,
                    isPhone: true,
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
                        _performRegister();
                      }
                    },
                    child: const Text('تسجيل مستخدم'),
                  ),
                  SizedBox(height: 16.h),
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

  void _performRegister() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      controller.isLoading(false);
      Get.offAllNamed(RoutesManager.homeScreen);
      showSnackbar(message: 'تم إنشاء الحساب بنجاح');
    });
  }

  void _performLoginWithGoogle() async {}
  void _performLoginWithApple() async {}
}
