import 'package:movemate/core/resources/data_state.dart';
import 'package:movemate/features/homepage/domain/entities/shipments.dart';
import 'package:movemate/features/homepage/domain/repository/shipments_repository.dart';

class ShipmentsRepositoryImpl implements ShipmentsRepository {
  @override
  Future<DataState<List<ShipmentsEntity>>> getNewShipments() {
    throw UnimplementedError();
  }
}
