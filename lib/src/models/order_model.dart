// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {

  String id; 
  
  @JsonKey(name: "createdAt")
  DateTime? createdDateTime;

  @JsonKey(name: "due")
  DateTime overdueDateTime;

  @JsonKey(defaultValue: [])
  List<CartItemModel> items;

  String status;

  @JsonKey(name: "copiaecola")
  String copyAndPaste;

  double total;
  
  String qrCodeImage;
  OrderModel({
    required this.id,
    this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
    required this.qrCodeImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
  



  @override
  String toString() {
    return 'OrderModel(id: $id, createdDateTime: $createdDateTime, overdueDateTime: $overdueDateTime, items: $items, status: $status, copyAndPaste: $copyAndPaste, total: $total, qrCodeImage: $qrCodeImage)';
  }

}
