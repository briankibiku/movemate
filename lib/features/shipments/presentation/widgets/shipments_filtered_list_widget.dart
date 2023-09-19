import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/core/constants/app_strings.dart';
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
                    AppString.emptyInbox,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppString.noShipments,
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
