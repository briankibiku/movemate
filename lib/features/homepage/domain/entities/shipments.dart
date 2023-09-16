import 'package:freezed_annotation/freezed_annotation.dart';
part 'shipments.g.dart';

@JsonSerializable()
class ShipmentsEntity {
  final String? status;
  final String? deliveryNumber;
  final String? eta;
  final String? origin;
  final double? cost;
  ShipmentsEntity(
    this.status,
    this.deliveryNumber,
    this.eta,
    this.origin,
    this.cost,
  );

  factory ShipmentsEntity.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsEntityFromJson(json);

  Map<String?, dynamic> toJson() => _$ShipmentsEntityToJson(this);
}
