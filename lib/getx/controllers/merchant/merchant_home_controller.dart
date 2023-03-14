import 'package:get/state_manager.dart';

class MerchantHomeController extends GetxController {
  MerchantHomeController._();
  static MerchantHomeController? _instance;
  factory MerchantHomeController() {
    return _instance ??= MerchantHomeController._();
  }
  final pageIndex = 0.obs;
  final isLoading = false.obs;
}
