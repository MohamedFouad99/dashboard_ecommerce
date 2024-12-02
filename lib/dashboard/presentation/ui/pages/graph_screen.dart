import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/animations/up_down_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controller/order_controller.dart';
import '../widgets/dashboard_column_bar_chart.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override

  /// Builds the widget tree for the GraphScreen.
  ///
  /// If the orders are still being fetched, it shows a CircularProgressIndicator.
  /// If there is an error, it shows the error message.
  /// Otherwise, it shows a DashboardColumnBarChart with the number of orders
  /// in each month, with a reverse UpDownAnimation.
  Widget build(BuildContext context) {
    final controller = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(title: const Text("Orders Over Time")),
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
              child: DashboardColumnBarChart(
                title: 'Number of Orders',
                titleIconAsset: 'assets/icons/history.svg',
                data: controller.numberOfOrdersInMonth,
              )),
        );
      }),
    );
  }
}
