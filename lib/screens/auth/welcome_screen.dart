import 'package:emraan/constants/colors_manager.dart';
import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/constants/text_styles_manager.dart';
import 'package:emraan/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.asset(
              ImagesManager.logo,
              width: 150.w,
            ),
          ),
          Container(
            height: Get.height * 0.6,
            padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 0),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(80.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ابحث عن مواد خام عالية الجودة',
                  style: TextStylesManager.title,
                ),
                SizedBox(height: 12.h),
                Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                  style: TextStylesManager.subTitle,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(RoutesManager.loginScreen);
                  },
                  child: const Text('ابدأ'),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
