import 'package:emraan/getx/controllers/customer_app/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
