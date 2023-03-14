import 'package:emraan/getx/controllers/merchant/merchant_package_details_controller.dart';
import 'package:emraan/getx/controllers/merchant/merchant_packages_controller.dart';
import 'package:get/get.dart';

class MerchantPackagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MerchantPackagesController());
    Get.lazyPut(() => MerchantPackageDetailsController());
  }
}
