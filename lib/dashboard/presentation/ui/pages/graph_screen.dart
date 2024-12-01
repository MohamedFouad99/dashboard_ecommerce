import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../controller/order_controller.dart';
import '../widgets/dashboard_column_bar_chart.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
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

        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: DashboardColumnBarChart(
              title: 'Number of Orders',
              titleIconAsset: 'assets/icons/history.svg',
              data: controller.numberOfOrdersInMonth,
            ));
      }),
    );
  }
}
