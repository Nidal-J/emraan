import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/colors_manager.dart';

void showLogoutDialog(
    {required String message,
    String? content,
    void Function()? onConfirm,
    required BuildContext context}) {
  showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsManager.white,
          titlePadding: EdgeInsets.fromLTRB(60.w, 40.h, 30.w, 10),
          actionsPadding: EdgeInsets.fromLTRB(20.w, 0.h, 30.w, 10),
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              Divider(
                thickness: 1,
                color: ColorsManager.dividerColor,
                endIndent: 70.w,
                height: 20.h,
              ),
            ],
          ),
          content: Text(content ?? ''),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  color: ColorsManager.success,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: ColorsManager.danger,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        );
      });
}
