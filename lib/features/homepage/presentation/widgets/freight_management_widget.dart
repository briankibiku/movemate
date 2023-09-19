import 'package:flutter/material.dart';
import 'package:movemate/core/constants/app_strings.dart';

import '../../../../config/theme/theme.dart';
import '../../data/repository/available_freight.dart';

class FreightManagementWidget extends StatelessWidget {
  const FreightManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppString.availableVehicles,
            style: AppTextStyles.mainHeadingTextStyle,
          ),
        ),
        HorizontalCardList()
      ],
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableFreights.length,
        itemBuilder: (context, index) {
          var availableFreight = availableFreights[index];
          return CardItem(
            freightType: availableFreight['freightType'],
            availablility: availableFreight['availablility'],
            imageUrl: availableFreight['imageUrl'],
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String freightType;
  final String availablility;
  final String imageUrl;

  const CardItem({
    super.key,
    required this.freightType,
    required this.availablility,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width / 2.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                freightType,
                style: AppTextStyles.sublteHeadingTextStyle,
              ),
              Text(
                availablility,
                style: AppTextStyles.metaDataTextStyle,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
