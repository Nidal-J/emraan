import 'package:emraan/constants/constants_manager.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors_manager.dart';

class CustomerLanguagesScreen extends StatefulWidget {
  const CustomerLanguagesScreen({super.key});

  @override
  State<CustomerLanguagesScreen> createState() =>
      _CustomerLanguagesScreenState();
}

class _CustomerLanguagesScreenState extends State<CustomerLanguagesScreen> {
  String lang = 'ar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اللغة'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    lang = 'ar';
                  });
                },
                child: Container(
                  height: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: ConstantsManager.customBoxShadow10,
                    color: ColorsManager.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اللغة العربية',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      CircleAvatar(
                        radius: 11.r,
                        backgroundColor: ColorsManager.subtitleColor,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: lang == 'ar'
                              ? ColorsManager.success
                              : ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  setState(() {
                    lang = 'en';
                  });
                },
                child: Container(
                  height: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: ConstantsManager.customBoxShadow10,
                    color: ColorsManager.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 11.r,
                        backgroundColor: ColorsManager.subtitleColor,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: lang == 'en'
                              ? ColorsManager.success
                              : ColorsManager.white,
                        ),
                      ),
                      Text(
                        'English',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
