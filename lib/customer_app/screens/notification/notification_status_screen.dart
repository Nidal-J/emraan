import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/show_snackbar.dart';

class NotificationStatusScreen extends StatelessWidget {
  const NotificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('الإشعارات'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImagesManager.notifyRespond),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تم توصيل طلبك رقم',
                    style: TextStylesManager.title,
                  ),
                  Text(
                    ' #1220',
                    style: TextStylesManager.title
                        .copyWith(color: ColorsManager.primary),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          showSnackbar(message: 'تم قبول الطلب بنجاح');
                        },
                        child: const Text('قبول الطلب'),
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(RoutesManager.notificationsRejectScreen);
                        },
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.center),
                        child: const Text('رفض الطلب'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
