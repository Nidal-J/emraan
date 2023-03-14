import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class CustomerProductDetailsController extends GetxController {
  final bannerIndex = 0.obs;
  final bannerController = PageController();
  final typeIndex = 0.obs;
  final isLoading = false.obs;
  final counter = 1.obs;

  final addFocusNode = FocusNode();
  final minusFocusNode = FocusNode();
}
