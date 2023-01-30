import 'dart:developer';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/getx/controllers/auth/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../core/widgets/top_right_radius.dart';
import '../../getx/controllers/auth/verification_controller.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/verify_field_widget.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: ConstantsManager.authAppBar,
          body: TopRightRadius(
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  Text(
                    'هل نسيت كلمة المرور ؟ ',
                    style: TextStylesManager.title,
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    label: 'الإيميل',
                    hintText: ForgetPasswordController().emailController.text,
                    isEmail: true,
                    readOnly: true,
                    fullColored: true,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'كود التحقق',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: 60,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: GetBuilder<VerificationController>(
                          builder: (context) {
                        return GridView(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 0.6,
                            mainAxisExtent: 50.h,
                          ),
                          children: [
                            VerifyFieldWidget(
                              autofocus: true,
                              codeController:
                                  controller.firstCodeTextController,
                              focusNode: controller.firstFocusNode,
                              filled: controller.firstCodeTextController.value
                                  .text.isNotEmpty,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.secondFocusNode.requestFocus();
                                }
                                controller.updateCode();
                                controller.update();
                                log(value);
                                log(controller.code.value);
                              },
                            ),
                            VerifyFieldWidget(
                              codeController:
                                  controller.secondCodeTextController,
                              focusNode: controller.secondFocusNode,
                              filled: controller.secondCodeTextController.value
                                  .text.isNotEmpty,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.thirdFocusNode.requestFocus();
                                } else {
                                  controller.firstFocusNode.requestFocus();
                                }
                                controller.updateCode();
                                controller.update();
                                log(value);
                                log(controller.code.value);
                              },
                            ),
                            VerifyFieldWidget(
                              codeController:
                                  controller.thirdCodeTextController,
                              focusNode: controller.thirdFocusNode,
                              filled: controller.thirdCodeTextController.value
                                  .text.isNotEmpty,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.fourthFocusNode.requestFocus();
                                } else {
                                  controller.secondFocusNode.requestFocus();
                                }
                                controller.updateCode();
                                controller.update();
                                log(value);
                                log(controller.code.value);
                              },
                            ),
                            VerifyFieldWidget(
                              codeController:
                                  controller.fourthCodeTextController,
                              focusNode: controller.fourthFocusNode,
                              filled: controller.fourthCodeTextController.value
                                  .text.isNotEmpty,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  controller.thirdFocusNode.requestFocus();
                                } else {
                                  controller.fourthFocusNode.unfocus();
                                }
                                controller.updateCode();
                                controller.update();
                                log(value);
                                log(controller.code.value);
                              },
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Obx(
                    () => IgnorePointer(
                      ignoring: controller.code.value.length != 4,
                      child: ElevatedButton(
                        onPressed: () {
                          _performVerification();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.code.value.length != 4
                                ? ColorsManager.diabled
                                : ColorsManager.primary),
                        child: const Text('تأكيد'),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('لم يصلني كود التحقق'),
                      Obx(
                        () => IgnorePointer(
                          ignoring: controller.counter.value != 0,
                          child: IconButton(
                            onPressed: () {
                              _performResend();
                            },
                            icon: SvgPicture.asset(
                              ImagesManager.resend,
                              color: controller.counter.value == 0
                                  ? ColorsManager.primary
                                  : ColorsManager.diabled,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سيتم ارسال كود التحقق في غضون ',
                        style: TextStylesManager.subTitle,
                      ),
                      Obx(() => Text(
                            '${controller.counter.value - (controller.counter.value ~/ 60) * 60}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: controller.counter.value == 0
                                  ? ColorsManager.diabled
                                  : ColorsManager.primary,
                              fontSize: 16.sp,
                            ),
                          )),
                      Text(
                        ' ثانية',
                        style: TextStylesManager.subTitle,
                      ),
                    ],
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

  void _performResend() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.toNamed(RoutesManager.verificationScreen));
    controller.setTimer();
    controller.isLoading(false);
  }

  void _performVerification() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.toNamed(RoutesManager.verificationScreen));
    Get.toNamed(RoutesManager.resetPasswordScreen);
    controller.isLoading(false);
  }
}
