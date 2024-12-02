import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/graph_screen.dart';
import 'package:dashboard_ecommerce/dashboard/presentation/ui/pages/metrics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/spacing_helper.dart';
import '../../../../core/theme/app_colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override

  /// Returns a Scaffold with a grey background, an app bar with the title
  /// "Order Dashboard", and a body with two ElevatedButtons centered in
  /// the screen. The first button navigates to the [MetricsScreen] page when
  /// pressed, and the second navigates to the [GraphScreen] page. The buttons
  /// are separated by 16 logical pixels.
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
