import 'dart:ui';

import 'package:dashboard_ecommerce/core/theme/app_colors.dart';
import 'package:dashboard_ecommerce/dashboard/data/models/chart_data.dart';
import 'package:get/get.dart';

import '../../domain/entites/order_entity.dart';
import '../../domain/use_case/fetch_orders_use_case.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  final FetchOrdersUseCase fetchOrdersUseCase;

  // Observables for managing state
  var orders = <Orders>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  // Metrics
  RxInt totalOrders = 0.obs;
  RxDouble averagePrice = 0.0.obs;
  //Graph
  RxInt numberOfReturns = 0.obs;
  RxMap<String, int> ordersByMonth = <String, int>{}.obs;
  OrderController(this.fetchOrdersUseCase);
  List<String> title = ['Total Orders', 'Average Price', 'Number of Returns'];
  List<Color> color = [
    AppColors.lightGreen,
    AppColors.orange,
    AppColors.darkRed
  ];
  List<int> values = [0, 0, 0];
  List<ChartData> numberOfOrdersInMonth = [];
  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await fetchOrdersUseCase.call();
    result.fold(
      (failure) => errorMessage.value = failure.message,
      (fetchedOrders) {
        orders.value = fetchedOrders;
        calculateMetrics();
        calculateOrdersByMonth();
      },
    );
    isLoading.value = false;
  }

  void calculateMetrics() {
    totalOrders.value = orders.length;
    averagePrice.value = orders
            .map((order) => order.price.toDoublePrice())
            .fold(0.0, (prev, price) => prev + price) /
        (orders.isEmpty ? 1 : orders.length);
    numberOfReturns.value =
        orders.where((order) => order.status == "RETURNED").length;
    values = [
      totalOrders.value,
      averagePrice.value.toInt(),
      numberOfReturns.value
    ];
  }

  List<String> monthOrder = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  void calculateOrdersByMonth() {
    numberOfOrdersInMonth = [];
    Map<String, int> groupedOrders = {};

    for (var order in orders) {
      final month = DateFormat("MMM").format(DateTime.parse(order.registered));
      groupedOrders[month] = (groupedOrders[month] ?? 0) + 1;
    }

    final sortedEntries = groupedOrders.entries.toList()
      ..sort((a, b) =>
          monthOrder.indexOf(a.key).compareTo(monthOrder.indexOf(b.key)));

    numberOfOrdersInMonth = sortedEntries
        .map((entry) =>
            ChartData(xAxisLabel: entry.key, yAxisLabel: entry.value))
        .toList();

    ordersByMonth.value = Map.fromEntries(sortedEntries);
  }
}

// to remove non-numeric characters like commas ","
extension StringPriceExtension on String {
  double toDoublePrice() {
    return double.parse(replaceAll(RegExp(r'[^0-9.]'), ''));
  }
}
