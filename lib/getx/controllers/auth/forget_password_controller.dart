import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController._();
  static ForgetPasswordController? _instance;
  factory ForgetPasswordController() {
    return _instance ??= ForgetPasswordController._();
  }
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
}
