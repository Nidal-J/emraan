import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';

void showLogoutDialog(
    {required String message,
    String? content,
    void Function()? onConfirm,
    required BuildContext context}) {
  showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        if (Platform.isAndroid) {
          return AlertDialog(
            backgroundColor: ColorsManager.white,
            titlePadding: EdgeInsets.fromLTRB(60.w, 40.h, 30.w, 10),
            actionsPadding: EdgeInsets.fromLTRB(20.w, 0.h, 30.w, 10),
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
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
        } else {
          return CupertinoAlertDialog(
            title: Text(message),
            content: Text(content ?? ''),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'تسجيل الخروج',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorsManager.danger,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton(
                onPressed: onConfirm,
                child: Text(
                  'إلغاء',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.success,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(width: 80.w),
            ],
          );
        }
      });
  // Get.defaultDialog(
  //   title: message,
  //   titlePadding: EdgeInsets.only(top: 20.h),
  //   middleText: '',
  //   content: Divider(
  //     thickness: 1,
  //     indent: 100.w,
  //     endIndent: 100.w,
  //   ),
  //   contentPadding: EdgeInsets.zero,
  //   radius: 20.r,
  //   actions: [
  //     TextButton(
  //       onPressed: onConfirm,
  //       child: Text(
  //         'Yes',
  //         style: TextStyle(
  //           color: ColorsManager.green,
  //           fontSize: 32.sp,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //     // SizedBox(width: 80.w),
  //     TextButton(
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text(
  //         'Cancel',
  //         style: TextStyle(
  //           color: ColorsManager.green,
  //           fontSize: 32.sp,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}
