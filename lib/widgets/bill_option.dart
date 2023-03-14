import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_manager.dart';

class BillOption extends StatelessWidget {
  const BillOption({
    Key? key,
    required this.price,
    required this.title,
    this.finalPrice = false,
  }) : super(key: key);
  final String price;
  final String title;
  final bool finalPrice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: RichText(
        text: TextSpan(
          text: price,
          style: TextStyle(
            color: finalPrice
                ? ColorsManager.success
                : ColorsManager.subtitleColor,
            fontSize: 16.sp,
          ),
          children: [
            TextSpan(
              text: ' ر.س',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
