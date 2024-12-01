import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/graph_screen.dart';
import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/metrics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/spacing_helper.dart';
import '../../../../core/theme/app_colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(title: const Text("Order Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(const MetricsScreen()),
              child: const Text("View Metrics"),
            ),
            verticalSpace(16),
            ElevatedButton(
              onPressed: () => Get.to(const GraphScreen()),
              child: const Text("View Graph"),
            ),
          ],
        ),
      ),
    );
  }
}
