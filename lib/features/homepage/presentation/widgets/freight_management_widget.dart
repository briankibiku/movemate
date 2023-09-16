import 'package:flutter/material.dart';

class FreightManagementWidget extends StatelessWidget {
  const FreightManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
            alignment: Alignment.centerLeft, child: Text('Available Vehicles')),
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
        'freightType': 'Ocean Frieght',
        'availablility': 'International',
        'imageUrl': 'assets/images/forklift.png',
      },
      {
        'freightType': 'Cargo Frieght',
        'availablility': 'Reliable',
        'imageUrl': 'assets/images/forklift.png',
      },
      {
        'freightType': 'Air Frieght',
        'availablility': 'International',
        'imageUrl': 'assets/images/forklift.png',
      },
      {
        'freightType': 'Space Frieght',
        'availablility': 'Spartial',
        'imageUrl': 'assets/images/forklift.png',
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
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  availablility,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
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
