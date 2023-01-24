import 'package:emraan/getx/controllers/app/orders_controller.dart';
import 'package:get/get.dart';
import '../../controllers/app/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OrdersController());
  }
}
