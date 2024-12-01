import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entites/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<Orders>>> fetchOrders();
}
