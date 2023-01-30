import 'package:emraan/getx/controllers/customer_app/add_feedback_controller.dart';
import 'package:get/get.dart';

import '../../controllers/customer_app/feedback_details_controller.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddFeedbackController());
    Get.lazyPut(() => FeedbackDetailsController());
  }
}
