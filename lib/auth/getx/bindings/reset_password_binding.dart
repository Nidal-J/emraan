import 'package:get/get.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
