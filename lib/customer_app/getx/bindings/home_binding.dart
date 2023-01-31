import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/orders_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OrdersController());
  }
}
