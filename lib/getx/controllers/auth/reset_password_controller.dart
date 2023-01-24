import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class ResetPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final newPasswordVisible = false.obs;
  final confirmPasswordVisible = false.obs;
  final isLoading = false.obs;
}
