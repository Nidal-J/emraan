import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/constants/constants_manager.dart';

class EditServicesEvaluationScreen extends StatelessWidget {
  const EditServicesEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقييم الخدمات'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: 220.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsManager.cardColor,
                boxShadow: ConstantsManager.customBoxShadow10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'تقييم التاجر',
                    style: TextStylesManager.title,
                  ),
                  RatingBar(
                    glowColor: ColorsManager.success,
                    glowRadius: 0,
                    itemSize: 60.r,
                    minRating: 1,
                    wrapAlignment: WrapAlignment.center,
                    itemPadding: EdgeInsets.zero,
                    unratedColor: ColorsManager.subtitleColor,
                    initialRating: 3,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star_rounded,
                        color: ColorsManager.warning,
                      ),
                      half: const Icon(Icons.star_rate_rounded),
                      empty: const Icon(
                        Icons.star_outline_rounded,
                        color: ColorsManager.subtitleColor,
                      ),
                    ),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            const TextFieldWidget(
              label: 'اكتب تقييم للتاجر',
              hintText: 'اكتب هنا ...',
              filled: true,
              multiLines: true,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _performEditEvaluating();
                    },
                    child: const Text('تعديل'),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorsManager.subtitleColor,
                      side:
                          const BorderSide(color: ColorsManager.subtitleColor),
                    ),
                    child: const Text('الغاء'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performEditEvaluating() {
    Get.back();
    showSnackbar(message: 'تم تعديل التقييم بنجاح');
  }
}
