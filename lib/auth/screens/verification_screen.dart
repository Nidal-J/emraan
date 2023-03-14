import 'package:emraan/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../core/widgets/top_right_radius.dart';
import '../../core/constants/text_styles_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../getx/controllers/forget_password_controller.dart';
import '../getx/controllers/verification_controller.dart';

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
                  SizedBox(height: 10.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      animationType: AnimationType.scale,
                      textStyle: TextStyle(
                        fontSize: 22.sp,
                        color: ColorsManager.white,
                      ),
                      scrollPadding: EdgeInsets.zero,
                      cursorColor: ColorsManager.primary,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1,
                        fieldHeight: 52.h,
                        fieldWidth: 80.w,
                        activeFillColor: ColorsManager.primary,
                        activeColor: ColorsManager.primary,
                        inactiveColor: ColorsManager.subtitleColor,
                        inactiveFillColor: Colors.white,
                        selectedColor: ColorsManager.primary,
                        selectedFillColor:
                            ColorsManager.primary.withOpacity(0.6),
                        fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 2.w),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      controller: controller.codeController,
                      onChanged: (value) {
                        controller.codeCompleted(value.length == 4);
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Obx(
                    () => IgnorePointer(
                      ignoring: !controller.codeCompleted.value,
                      child: ElevatedButton(
                        onPressed: () {
                          _performVerification();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.codeCompleted.value
                                ? ColorsManager.primary
                                : ColorsManager.diabled),
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
