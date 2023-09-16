import 'package:flutter/material.dart';

class ShippingStatusIndicatorWidget extends StatelessWidget {
  final Icon icon;
  final String status;
  const ShippingStatusIndicatorWidget(
      {super.key, required this.icon, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      width: 120,
      height: 38,
      decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(
            status,
            style: const TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }
}
