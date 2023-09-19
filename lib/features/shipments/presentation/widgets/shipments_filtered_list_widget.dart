import 'package:flutter/material.dart';
import 'package:movemate/features/shipments/presentation/widgets/shipments_history_card.dart';

import '../../data/data_sources/shipment_tracking.dart';

class FilteredList extends StatelessWidget {
  final String status;
  final List<ShipmentTracking> itemList;

  const FilteredList({super.key, required this.status, required this.itemList});

  @override
  Widget build(BuildContext context) {
    // Filter items based on the selected status
    final filteredItems =
        itemList.where((item) => item.status == status).toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ShipmentsHistoryCardWidget(shipment: filteredItems[index]),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
