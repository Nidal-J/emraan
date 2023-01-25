import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MerchantProfileTab extends StatelessWidget {
  const MerchantProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
      child: Center(
        child: Text(
          'my profile',
          style: TextStylesManager.title,
        ),
      ),
    );
  }
}
