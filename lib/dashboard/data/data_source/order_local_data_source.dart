import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/order_model.dart';

abstract class OrderLocalDataSource {
  Future<List<OrderModel>> fetchOrders();
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  @override
  Future<List<OrderModel>> fetchOrders() async {
    final String response = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => OrderModel.fromJson(json)).toList();
  }
}
