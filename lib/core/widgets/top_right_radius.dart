import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/colors_manager.dart';

class TopRightRadius extends StatelessWidget {
  const TopRightRadius({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            border: Border.all(
              color: ColorsManager.primary,
              width: 0.5,
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(60.r)),
            border: Border.all(
              color: ColorsManager.white,
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}

class RPSCustomPainter1 extends CustomPainter {
  RPSCustomPainter1({required this.color});

  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width * 0.9645143, size.height * 0.6979187,
        size.width * 0.7126857, size.height * 0.6962125);
    path0.cubicTo(
        size.width * 0.5879000,
        size.height * 0.6957012,
        size.width * 0.3383286,
        size.height * 0.6946787,
        size.width * 0.2135429,
        size.height * 0.6941675);
    path0.quadraticBezierTo(size.width * 0.0401571, size.height * 0.6917231, 0,
        size.height * 0.4230397);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
