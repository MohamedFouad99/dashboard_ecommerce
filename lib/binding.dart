import 'package:get/get.dart';
import 'dashboard/data/data_source/order_local_data_source.dart';
import 'dashboard/data/repo/order_repository_impl.dart';
import 'dashboard/domain/repo/orders_repository.dart';
import 'dashboard/domain/use_case/fetch_orders_use_case.dart';
import 'dashboard/presentation/controller/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    // Register data source
    Get.lazyPut<OrderLocalDataSource>(() => OrderLocalDataSourceImpl());

    // Register repository
    Get.lazyPut<OrderRepository>(
      () => OrderRepositoryImpl(Get.find<OrderLocalDataSource>()),
    );

    // Register use case
    Get.lazyPut(() => FetchOrdersUseCase(Get.find<OrderRepository>()));

    // Register controller
    Get.put(OrderController(Get.find<FetchOrdersUseCase>()));
  }
}
