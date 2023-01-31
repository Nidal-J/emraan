import 'package:get/get.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
