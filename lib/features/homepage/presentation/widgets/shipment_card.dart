import 'package:flutter/material.dart';

class ShipmentCardWidget extends StatelessWidget {
  const ShipmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> customerDetails = [
      {
        'customerTitle': 'Sender',
        'place': 'Atlanta, 5243',
        'time': '2 day - 3 days',
        'action': 'sending'
      },
      {
        'customerTitle': 'Receiver',
        'place': 'Chicago, 6342',
        'status': 'Waiting to collect',
        'time': '',
        'action': 'receiving'
      }
    ];

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [Text('Shipment number'), Text('shipments numebr')],
              ),
              Image.asset('assets/images/forklift.png'),
            ],
          ),
          const Divider(
            color: Colors.grey, // Customize the color of the divider
            thickness: 0.5, // Customize the thickness of the divider
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: customerDetails.length,
              itemBuilder: (BuildContext context, index) {
                var customerDetail = customerDetails[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: customerDetail['action'] == 'receiving'
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: Image.asset(
                                customerDetail['action'] == 'receiving'
                                    ? 'assets/images/import.png'
                                    : 'assets/images/export.png'),
                          ),
                          Column(
                            children: [
                              Text(customerDetail['customerTitle']),
                              Text(customerDetail['place'])
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/images/forklift.png'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.grey, // Customize the color of the divider
            thickness: 0.5, // Customize the thickness of the divider
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                color: const Color(0xFFF37A1F),
                onPressed: () {},
              ),
              const Text(
                'Add Stop',
                style: TextStyle(
                  color: Color(0xFFF37A1F),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
