import 'package:emraan/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showToast(BuildContext context, {required String message, double? width}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        width: width,
        padding: const EdgeInsets.all(10),
        shape: const StadiumBorder(),
        backgroundColor: Colors.black54,
        duration: const Duration(seconds: 1),
      ),
    );
}
