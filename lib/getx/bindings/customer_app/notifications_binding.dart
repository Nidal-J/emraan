import 'package:emraan/getx/controllers/customer_app/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
