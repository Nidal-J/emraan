import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors_manager.dart';
import '../../getx/controllers/notifications_controller.dart';

class NotificationRejectScreen extends GetView<NotificationController> {
  const NotificationRejectScreen({super.key});

  static List<String> reasons = [
    'السبب الأول',
    'السبب الثاني',
    'سبب آخر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حدد سبب الرفض'),
      ),
      body: TopRightRadius(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          children: [
            const Text('حدد سبب الرفض'),
            SizedBox(height: 10.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => controller.rejectReasonIndex.value = index,
                  child: ProfileCardWidget(
                    padding: EdgeInsets.fromLTRB(14.w, 26.h, 32.w, 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(reasons[index]),
                        Obx(() => CircleAvatar(
                              radius: 13.r,
                              backgroundColor: ColorsManager.dividerColor,
                              child: CircleAvatar(
                                radius: 12.r,
                                backgroundColor:
                                    controller.rejectReasonIndex.value == index
                                        ? ColorsManager.success
                                        : ColorsManager.cardColor,
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            Obx(() => Visibility(
                  visible: controller.rejectReasonIndex.value == 2,
                  child: const TextFieldWidget(
                    label: 'اذكر سبب آخر',
                    hintText: 'اكتب هنا ...',
                    minLines: 5,
                    maxLines: 5,
                    isValidated: false,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                  ),
                )),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
