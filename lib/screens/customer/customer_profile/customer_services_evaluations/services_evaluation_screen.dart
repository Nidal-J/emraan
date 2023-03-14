import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/customer_profile_card_widget.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors_manager.dart';

class ServicesEvaluationScreen extends StatelessWidget {
  const ServicesEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقييم الخدمات'),
      ),
      body: TopRightRadius(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (BuildContext context, int index) {
            return CustomerProfileCardWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اسم التاجر',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  Column(
                    children: [
                      RatingBar(
                        itemSize: 28.r,
                        minRating: 1,
                        wrapAlignment: WrapAlignment.center,
                        initialRating: 2.0 + index,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star_rate_rounded,
                            color: ColorsManager.warning,
                          ),
                          half: const Icon(Icons.star_rate_rounded),
                          empty: const Icon(
                            Icons.star_border_rounded,
                            color: ColorsManager.subtitleColor,
                          ),
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                      ),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    onPressed: () =>
                        Get.toNamed(RoutesManager.editServicesEvaluationScreen),
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
