import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';

class FreightManagementWidget extends StatelessWidget {
  const FreightManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Available Vehicles',
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
    List<Map<String, dynamic>> availableFreights = [
      {
        'freightType': 'Ocean Freight',
        'availablility': 'International',
        'imageUrl': 'assets/images/ship.png',
      },
      {
        'freightType': 'Cargo Freight',
        'availablility': 'Reliable',
        'imageUrl': 'assets/images/track.png',
      },
      {
        'freightType': 'Air Freight',
        'availablility': 'International',
        'imageUrl': 'assets/images/ship.png',
      },
      {
        'freightType': 'Space Freight',
        'availablility': 'Spartial',
        'imageUrl': 'assets/images/track.png',
      },
    ];
    return SizedBox(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableFreights.length, // Number of cards
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
      width: MediaQuery.of(context).size.width / 2.7,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      // elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
      ),
    );
  }
}
