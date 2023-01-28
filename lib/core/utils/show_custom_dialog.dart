import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  Widget? content,
  void Function()? onConfirm,
  String? backText,
  bool hasBackButton = true,
}) {
  // if (Platform.isAndroid) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            content ?? Container(),
            SizedBox(height: 36.h),
            hasBackButton
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onConfirm,
                          child: const Text('تأكيد'),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: OutlinedButton.styleFrom(
                              alignment: Alignment.center),
                          child: Text(backText ?? 'إلغاء'),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: Get.width * 0.42,
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      child: const Text('تأكيد'),
                    ),
                  ),
          ],
        ),
      ),
    ),
  );
  // } else {
  // showDialog(
  //   context: context,
  //   builder: (context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: content,
  //     actions: [
  //       TextButton(
  //         onPressed: () {
  //           Get.back();
  //         },
  //         style: TextButton.styleFrom(
  //           alignment: Alignment.center,
  //         ),
  //         child: const Text('إلغاء'),
  //       ),
  //       TextButton(
  //         onPressed: onConfirm,
  //         style: TextButton.styleFrom(
  //           alignment: Alignment.center,
  //         ),
  //         child: const Text('تأكيد'),
  //       ),
  //       // SizedBox(width: 80.w),
  //     ],
  //   ),
  // );
  // }

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
