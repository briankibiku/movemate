import 'package:flutter/material.dart';
import 'package:movemate/features/shipments/presentation/widgets/progress_indicator_widget.dart';

import '../../../../config/theme/theme.dart';
import '../../data/data_sources/shipment_tracking.dart';

class ShipmentsHistoryCardWidget extends StatelessWidget {
  final ShipmentTracking shipment;
  const ShipmentsHistoryCardWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    Color indicatorColor(status) {
      switch (status) {
        case 'in-progress':
          return AppColors.greenColor;
        case 'pending':
          return AppColors.primaryColorLight;
        case 'loading':
          return AppColors.blueColor;
        default:
          return Colors.grey;
      }
    }

    Icon indicatorIcon(status) {
      switch (status) {
        case 'in-progress':
          return Icon(
            Icons.update,
            size: 20,
            color: indicatorColor(shipment.status),
          );
        case 'pending':
          return Icon(
            Icons.timelapse,
            size: 20,
            color: indicatorColor(shipment.status),
          );
        case 'loading':
          return Icon(
            Icons.av_timer_sharp,
            size: 20,
            color: indicatorColor(shipment.status),
          );
        default:
          return Icon(
            Icons.timer,
            size: 20,
            color: indicatorColor(shipment.status),
          );
      }
    }

    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShippingStatusIndicatorWidget(
            icon: indicatorIcon(shipment.status),
            status: shipment.status,
            textColor: indicatorColor(shipment.status),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shipment.eta,
                        style: AppTextStyles.miniSubHeadingTextStyle,
                      ),
                      Text(
                        'Your delivery ${shipment.deliveryNumber} from is arriving today',
                        style: AppTextStyles.metaDataTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${shipment.cost} USD',
                        style: AppTextStyles.currencyTextStyle,
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
                        shipment.arrivalDate,
                        style: AppTextStyles.cardMetaTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                'assets/images/package.png',
                height: 50,
                width: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
