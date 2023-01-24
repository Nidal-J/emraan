import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class VerificationController extends GetxController {
  final firstCodeTextController = TextEditingController();
  final secondCodeTextController = TextEditingController();
  final thirdCodeTextController = TextEditingController();
  final fourthCodeTextController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();

  final isLoading = false.obs;
  final code = ''.obs;

  late Timer timer;
  final counter = 0.obs;

  void updateCode() {
    code.value = firstCodeTextController.text +
        secondCodeTextController.text +
        thirdCodeTextController.text +
        fourthCodeTextController.text;
  }

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
