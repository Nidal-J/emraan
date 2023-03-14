import 'package:get/get.dart';
import '../../controllers/customer/customer_home_controller.dart';
import '../../controllers/customer/customer_orders_controller.dart';

class CustomerHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerHomeController());
    Get.lazyPut(() => CustomerOrdersController());
  }
}
