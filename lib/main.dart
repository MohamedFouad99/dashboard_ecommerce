import 'package:dashboard_ecommerce/binding.dart';
import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// The main entry point of the application.
void main() {
  // Runs the app and initializes the widget tree starting with MyApp.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  /// Builds the root of the application.
  ///
  /// This widget is the root of the application. It sets up the
  /// [GetMaterialApp] widget and initializes the widget tree starting with the
  /// [OrdersScreen].
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// Min text size that will not be scaled.
      minTextAdapt: true,

      /// If [true], the font size will scale based on the screen size.
      splitScreenMode: true,

      /// The design size of the screen. This is the size of the screen that the
      /// application is designed for.
      designSize: context.isTablet
          ? (context.isLandscape
              ? const Size(1024, 800)
              : const Size(768, 1024))
          : context.isLandscape
              ? const Size(812, 900)
              : const Size(375, 812),

      /// The font size resolver function. This function is used to calculate the
      /// font size based on the screen size.
      fontSizeResolver: (fontSize, instance) =>
          FontSizeResolvers.height(fontSize, instance),

      /// The child of the [ScreenUtilInit] widget. This is the widget that will
      /// be rendered on the screen.
      child: GetMaterialApp(
        /// The initial binding of the application. This is the binding that
        /// will be used when the application is first started.
        initialBinding: OrderBinding(),

        /// The home of the application. This is the widget that will be
        /// rendered on the screen when the application is first started.
        home: const OrdersScreen(),
      ),
    );
  }
}
