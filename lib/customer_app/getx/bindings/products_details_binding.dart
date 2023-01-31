import 'package:get/get.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
