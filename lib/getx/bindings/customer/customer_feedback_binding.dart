import 'package:get/get.dart';
import '../../controllers/customer/customer_add_feedback_controller.dart';
import '../../controllers/customer/customer_feedback_details_controller.dart';

class CustomerFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerAddFeedbackController());
    Get.lazyPut(() => CustomerFeedbackDetailsController());
  }
}
