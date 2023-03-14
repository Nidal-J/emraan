import 'package:get/state_manager.dart';

class CustomerHomeController extends GetxController {
  CustomerHomeController._();
  static CustomerHomeController? _instance;
  factory CustomerHomeController() {
    return _instance ??= CustomerHomeController._();
  }
  final pageIndex = 0.obs;
  final isLoading = false.obs;
}
