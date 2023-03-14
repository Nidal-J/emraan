import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants/colors_manager.dart';

void showSnackbar({
  String? title,
  required String message,
  bool success = true,
  int duration = 2,
}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      backgroundColor: success ? ColorsManager.success : ColorsManager.danger,
      message: message,
      duration: Duration(seconds: duration),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
