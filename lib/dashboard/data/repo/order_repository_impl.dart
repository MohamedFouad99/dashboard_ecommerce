import 'package:dartz/dartz.dart';

import 'package:dashboard_ecommerce/core/errors/failure.dart';

import '../../domain/entites/order_entity.dart';
import '../../domain/repo/orders_repository.dart';
import '../data_source/order_local_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource localDataSource;

  OrderRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Orders>>> fetchOrders() async {
    try {
      final orders = await localDataSource.fetchOrders();
      return Right(orders);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
