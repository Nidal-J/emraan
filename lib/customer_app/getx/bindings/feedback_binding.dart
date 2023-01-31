import 'package:get/get.dart';
import '../controllers/add_feedback_controller.dart';
import '../controllers/feedback_details_controller.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddFeedbackController());
    Get.lazyPut(() => FeedbackDetailsController());
  }
}
