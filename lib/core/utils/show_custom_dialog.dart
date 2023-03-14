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
}
