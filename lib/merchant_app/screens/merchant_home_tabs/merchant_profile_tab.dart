import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/merchant_app/getx/controllers/merchant_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes_manager.dart';
import '../../../core/utils/show_logout_dialog.dart';
import '../../../core/utils/show_snackbar.dart';

class MerchantProfileTab extends StatelessWidget {
  const MerchantProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'my profile',
              style: TextStylesManager.title,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _performLogout(context);
            },
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }

  _performLogout(BuildContext context) {
    showLogoutDialog(
      message: 'أنت على وشك تسجيل الخروج! هل تريد الإستمرار؟',
      context: context,
      onConfirm: () async {
        Get.back();
        MerchantHomeController().isLoading(true);
        // TODO: Replace with API request
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(RoutesManager.loginScreen);
        MerchantHomeController().isLoading(false);
        MerchantHomeController().pageIndex(0);
        showSnackbar(message: 'تم تسجيل الخروج بنجاح');
      },
    );
  }
}
