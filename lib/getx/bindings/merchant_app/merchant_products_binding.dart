import 'package:emraan/getx/controllers/merchant_app/merchant_product_details_controller.dart';
import 'package:emraan/getx/controllers/merchant_app/merchant_products_controller.dart';
import 'package:get/get.dart';

class MerchantProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MerchantProductsController());
    Get.lazyPut(() => MerchantProductDetailsController());
  }
}
