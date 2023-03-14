import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomerAddFeedbackController extends GetxController {
  final noteTitleController = TextEditingController();
  final noteDetailsController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
}
