import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../getx/controllers/feedback_details_controller.dart';

class FeedbackDetailsScreen extends GetView<FeedbackDetailsController> {
  const FeedbackDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الملاحظة'),
      ),
      body: TopRightRadius(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
              physics: const BouncingScrollPhysics(),
              children: [
                const TextFieldWidget(
                  label: 'اسم الملاحظة',
                  hintText: 'اسم الملاحظة',
                  filled: true,
                  readOnly: true,
                ),
                SizedBox(height: 10.h),
                const TextFieldWidget(
                  label: 'التفاصيل',
                  hintText: 'اكتب هنا ...',
                  filled: true,
                  multiLines: true,
                  readOnly: true,
                ),
                SizedBox(height: 10.h),
                const Text('الصور'),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Image.asset(ImagesManager.placeholder),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('تاريخ الارسال '),
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: ColorsManager.cardColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              '20/12/2022',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('حالة الملاحظة'),
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: ColorsManager.danger.withOpacity(0.3),
                              // color: Color(0xFFFEEBB4),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              'تحت المراجعة',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                top: 44,
                left: 20,
                child: InkWell(child: SvgPicture.asset(ImagesManager.trash))),
          ],
        ),
      ),
    );
  }
}
