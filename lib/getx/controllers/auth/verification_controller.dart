import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class VerificationController extends GetxController {
  final codeController = TextEditingController();
  final codeCompleted = false.obs;
  final isLoading = false.obs;
  final counter = 0.obs;
  late Timer timer;

  void setTimer() {
    counter(60);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (counter.value == 0) {
          timer.cancel();
        } else {
          counter.value--;
        }
      },
    );
  }

  @override
  void onInit() {
    setTimer();
    super.onInit();
  }
}
