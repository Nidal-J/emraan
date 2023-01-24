import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors_manager.dart';

class TextStylesManager {
  static final TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle subTitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.subtitleColor,
  );
}
