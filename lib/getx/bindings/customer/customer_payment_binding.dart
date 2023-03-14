import 'package:get/get.dart';
import '../../controllers/customer/customer_payment_controller.dart';

class CustomerPaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerPaymentController());
  }
}
