import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class ProductDetailsController extends GetxController {
  final bannerIndex = 0.obs;
  final typeIndex = 0.obs;
  final isLoading = false.obs;
  final counter = 1.obs;

  final addFocusNode = FocusNode();
  final minusFocusNode = FocusNode();
}
