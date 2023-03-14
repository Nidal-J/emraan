import 'package:get/get.dart';
import '../../controllers/customer/customer_edit_profile_controller.dart';

class CustomerEditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerEditProfileController());
  }
}
