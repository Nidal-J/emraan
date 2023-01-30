import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/routes/get_pages.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/theme/theme_manager.dart';
import 'screens/customer_app/unknown_screen.dart';

void main() {
  runApp(const MyApp());
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return GetMaterialApp(
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.light(),
          builder: (context, widget) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviorModified(),
              child: widget!,
            );
          },
          initialRoute: RoutesManager.welcomeScreen,
          getPages: getPages,
          defaultTransition: Transition.fade,
          unknownRoute: GetPage(
            name: RoutesManager.unknownScreen,
            page: () => const UnknownScreen(),
          ),
        );
      },
    );
  }
}
