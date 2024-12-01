import '../../domain/entites/order_entity.dart';

class OrderModel extends Orders {
  OrderModel({
    required super.id,
    required super.isActive,
    required super.price,
    required super.company,
    required super.picture,
    required super.buyer,
    required super.tags,
    required super.status,
    required super.registered,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: List<String>.from(json['tags']),
      status: json['status'],
      registered: json['registered'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isActive': isActive,
      'price': price,
      'company': company,
      'picture': picture,
      'buyer': buyer,
      'tags': tags,
      'status': status,
      'registered': registered,
    };
  }
}
