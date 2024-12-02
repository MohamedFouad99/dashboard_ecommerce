import 'package:dashboard_ecommerce/core/theme/app_colors.dart';
import 'package:dashboard_ecommerce/dashboard/presentation/ui/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/animations/up_down_animation.dart';
import '../../controller/order_controller.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override

  /// Builds the UI for the MetricsScreen widget.
  ///
  /// This function constructs a `Scaffold` widget that displays the order metrics.
  /// It uses the `OrderController` to manage application state and determine if
  /// data is loading or if there are any errors. The screen adapts to tablet or
  /// non-tablet layouts and displays a grid of `DashboardCard` widgets, which
  /// show different metrics. The grid is wrapped in an `UpDownAnimation` for
  /// transition effects. If data is loading, a `CircularProgressIndicator` is
  /// shown, and if there is an error, the error message is displayed.
  Widget build(BuildContext context) {
    final controller = Get.find<OrderController>();
    var isTablet = context.isTablet;
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(title: const Text("Order Metrics")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return UpDownAnimation(
          reverse: true,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.h,
                  mainAxisSpacing: 12.w,
                  childAspectRatio: isTablet ? 2 : 1,
                ),
                itemBuilder: (context, index) {
                  return DashboardCard(
                      color: controller.color[index],
                      title: controller.title[index],
                      value: controller.values[index]);
                },
              )),
        );
      }),
    );
  }
}
