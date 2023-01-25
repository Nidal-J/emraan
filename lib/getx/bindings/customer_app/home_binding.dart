import 'package:emraan/getx/controllers/customer_app/orders_controller.dart';
import 'package:get/get.dart';
import '../../controllers/customer_app/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OrdersController());
  }
}
