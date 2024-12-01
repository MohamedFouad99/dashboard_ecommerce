import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../entites/order_entity.dart';
import '../repo/orders_repository.dart';

class FetchOrdersUseCase {
  final OrderRepository repository;

  FetchOrdersUseCase(this.repository);

  Future<Either<Failure, List<Orders>>> call() async {
    return await repository.fetchOrders();
  }
}
