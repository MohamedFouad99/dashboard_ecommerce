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
  @override

  /// Called when the controller is initialized.
  ///
  /// This method overrides the `onInit` method of `GetxController`.
  /// It performs initial setup tasks, such as fetching orders
  /// to populate the orders list with data from the repository.
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  /// Fetches orders from the repository.
  ///
  /// This method initiates the fetching process by calling the `fetchOrdersUseCase`.
  /// It updates the loading state during the process and handles any potential
  /// failures by setting an error message. Upon successful fetching, it updates
  /// the `orders` observable with the fetched data and recalculates metrics and
  /// orders by month. It ensures the loading state is reset at the end of the process.
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

  /// Calculates metrics from the orders list.
  ///
  /// This method calculates the total number of orders, the average price of all orders,
  /// and the number of orders with the status 'RETURNED'. It updates the respective
  /// observables with the calculated values. It also updates the values list with the
  /// calculated values, for use in the metrics chart.
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

  /// It calculates the number of orders in each month from the orders list.
  ///
  /// This method groups the orders by month (using the first three letters of the month name)
  /// and counts the number of orders in each month. It then sorts the grouped entries by month
  /// order and updates the `numberOfOrdersInMonth` observable with the sorted entries.
  /// It also updates the `ordersByMonth` observable with the sorted entries.
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
