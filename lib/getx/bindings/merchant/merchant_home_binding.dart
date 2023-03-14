import 'package:emraan/getx/controllers/merchant/merchant_home_controller.dart';
import 'package:emraan/getx/controllers/merchant/merchant_orders_controller.dart';
import 'package:get/get.dart';

class MerchantHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MerchantHomeController());
    Get.lazyPut(() => MerchantOrdersController());
  }
}
