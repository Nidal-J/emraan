import 'package:emraan/getx/controllers/customer_app/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
