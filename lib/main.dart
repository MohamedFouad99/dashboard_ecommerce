import 'package:dashboard_ecommerce/binding.dart';
import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: context.isTablet
          ? (context.isLandscape
              ? const Size(1024, 800)
              : const Size(768, 1024))
          : context.isLandscape
              ? const Size(812, 900)
              : const Size(375, 812),
      fontSizeResolver: (fontSize, instance) =>
          FontSizeResolvers.height(fontSize, instance),
      child: GetMaterialApp(
        initialBinding: OrderBinding(),
        home: const OrdersScreen(),
      ),
    );
  }
}
