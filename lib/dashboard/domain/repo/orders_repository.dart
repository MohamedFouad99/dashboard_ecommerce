import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entites/order_entity.dart';

abstract class OrderRepository {
  /// Fetches a list of orders from data source
  /// Returns a list of orders if successful, otherwise a failure
  Future<Either<Failure, List<Orders>>> fetchOrders();
}
