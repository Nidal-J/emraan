import 'package:get/get.dart';
import '../../controllers/customer/customer_notifications_controller.dart';

class CustomerNotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerNotificationController());
  }
}
