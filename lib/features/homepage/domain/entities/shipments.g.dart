// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentsEntity _$ShipmentsEntityFromJson(Map<String, dynamic> json) =>
    ShipmentsEntity(
      json['status'] as String?,
      json['deliveryNumber'] as String?,
      json['eta'] as String?,
      json['origin'] as String?,
      (json['cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShipmentsEntityToJson(ShipmentsEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'deliveryNumber': instance.deliveryNumber,
      'eta': instance.eta,
      'origin': instance.origin,
      'cost': instance.cost,
    };
