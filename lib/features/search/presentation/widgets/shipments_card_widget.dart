import 'package:flutter/material.dart';
import 'package:movemate/core/constants/app_strings.dart';

import '../../../../config/theme/theme.dart';
import '../../data/models/shipments_model.dart';

class ShipmentsCardWidget extends StatelessWidget {
  final Shipment shipment;
  const ShipmentsCardWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(40)),
                child: Image.asset(
                  AppString.packageImage,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shipment.itemShipped,
                    style: AppTextStyles.mainHeadingTextStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        shipment.shipmentNumber,
                        style: AppTextStyles.cardMetaTextStyle,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        shipment.origin,
                        style: AppTextStyles.cardMetaTextStyle,
                      ),
                      const Icon(Icons.arrow_forward,
                          color: Colors.grey, size: 15),
                      SizedBox(
                        width: 60,
                        child: Text(
                          shipment.destination,
                          style: AppTextStyles.cardMetaTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
