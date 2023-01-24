import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../core/widgets/top_right_radius.dart';
import '../../getx/controllers/auth/forget_password_controller.dart';
import '../../core/constants/text_styles_manager.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: ConstantsManager.authAppBar,
          body: TopRightRadius(
            child: Form(
              key: controller.formKey,
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
                      hintText: 'example@example.com',
                      controller: controller.emailController,
                      isEmail: true,
                    ),
                    SizedBox(height: 28.h),
                    ElevatedButton(
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          await _performReset();
                        }
                      },
                      child: const Text('أرسل كود التحقق'),
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

  Future<void> _performReset() async {
    controller.isLoading(true);
    // TODO: Replace with api request
    await Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.toNamed(RoutesManager.verificationScreen));
    controller.isLoading(false);
  }
}
