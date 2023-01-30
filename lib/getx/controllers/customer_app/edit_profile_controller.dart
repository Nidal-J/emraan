import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
}
