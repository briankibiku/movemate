import 'package:flutter/material.dart';
import 'package:movemate/features/homepage/presentation/widgets/shipment_card.dart';

import '../../../../config/theme/theme.dart';

class ShipmentsTrackingWidget extends StatefulWidget {
  const ShipmentsTrackingWidget({super.key});

  @override
  State<ShipmentsTrackingWidget> createState() =>
      _ShipmentsTrackingWidgetState();
}

class _ShipmentsTrackingWidgetState extends State<ShipmentsTrackingWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tracking',
            style: AppTextStyles.mainHeadingTextStyle,
          ),
        ),
        ShipmentCardWidget(),
      ],
    );
  }
}
