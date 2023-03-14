import 'package:get/get.dart';
import '../../controllers/customer/customer_product_details_controller.dart';

class CustomerProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerProductDetailsController());
  }
}
