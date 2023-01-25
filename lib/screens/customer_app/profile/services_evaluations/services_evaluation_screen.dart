import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors_manager.dart';

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
            return ProfileCardWidget(
              // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اسم التاجر',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => index < 3
                          ? const Icon(
                              Icons.star_rounded,
                              color: ColorsManager.warning,
                            )
                          : const Icon(
                              Icons.star_outline_rounded,
                              color: ColorsManager.subtitleColor,
                            ),
                    ),
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
