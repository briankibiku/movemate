import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';

import '../../data/repository/freight_customer_details.dart';

class ShipmentCardWidget extends StatelessWidget {
  const ShipmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipment number',
                    style: AppTextStyles.metaDataTextStyle,
                  ),
                  Text(
                    'NJNU65GYG7876',
                    style: AppTextStyles.mainHeadingTextStyle,
                  )
                ],
              ),
              Image.asset('assets/images/forklift.png'),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: customerDetails.length,
              itemBuilder: (BuildContext context, index) {
                var customerDetail = customerDetails[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
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
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customerDetail['customerTitle'],
                                  style: AppTextStyles.metaDataTextStyle,
                                ),
                                Text(
                                  customerDetail['place'],
                                  style: AppTextStyles.normalTextStyle,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customerDetail['arrivalStatus']['status'],
                              style: AppTextStyles.metaDataTextStyle,
                            ),
                            Text(
                              customerDetail['arrivalStatus']['eta'],
                              style: AppTextStyles.normalTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
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
