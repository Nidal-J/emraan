import 'package:emraan/getx/controllers/merchant/merchant_offers_controller.dart';
import 'package:get/get.dart';
import '../../controllers/merchant/merchant_offer_details_controller.dart';

class MerchantOffersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MerchantOffersController());
    Get.lazyPut(() => MerchantOfferDetailsController());
  }
}
