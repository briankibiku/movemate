class ShipmentTracking {
  final String status;
  final String eta;
  final String deliveryNumber;
  final String cost;
  final String arrivalDate;

  ShipmentTracking(
      {required this.status,
      required this.cost,
      required this.deliveryNumber,
      required this.arrivalDate,
      required this.eta});
}
