class ShipmentsModel {
  String status;
  String deliveryNumber;
  String eta;
  String origin;
  double cost;
  ShipmentsModel({
    required this.status,
    required this.deliveryNumber,
    required this.eta,
    required this.origin,
    required this.cost,
  });
  factory ShipmentsModel.fromJson(Map<String, dynamic> json) {
    return ShipmentsModel(
      status: json['status'] ?? "",
      deliveryNumber: json['deliveryNumber'] ?? "",
      eta: json['eta'] ?? "",
      origin: json['origin'] ?? "",
      cost: json['cost'] ?? 0,
    );
  }
}
