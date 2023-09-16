import 'package:movemate/core/resources/data_state.dart';
import 'package:movemate/features/homepage/domain/entities/shipments.dart';

abstract class ShipmentsRepository {
  Future<DataState<List<ShipmentsEntity>>> getNewShipments();
}
