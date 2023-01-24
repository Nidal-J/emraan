import 'package:emraan/getx/controllers/app/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
