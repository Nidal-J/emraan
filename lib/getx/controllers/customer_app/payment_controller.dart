import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PaymentController extends GetxController {
  final holderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final expDateController = TextEditingController();
  final expDate = DateTime.now().obs;

  final formKey = GlobalKey<FormState>();
  final cardIndex = 0.obs;
  final isLoading = false.obs;

  final progressIndex = 0.obs;
}
