import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
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

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          if (filteredItems.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (filteredItems.isEmpty)
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/empty.png',
                              height: 100,
                              width: 100,
                            ),
                            const Text(
                                'You do not have any shipments in this status'),
                          ],
                        ),
                      if (filteredItems.isNotEmpty)
                        ShipmentsHistoryCardWidget(
                            shipment: filteredItems[index]),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          if (filteredItems.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You do not have any shipments in this status',
                    style: AppTextStyles.normalTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
