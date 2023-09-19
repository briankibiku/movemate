import 'package:flutter/material.dart';

class PackageDropdownWidget extends StatelessWidget {
  const PackageDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                items: ['Box', 'Carton', 'Bag', 'Shipping box']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.outbox,
                            color: Colors.black26,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                value: 'Box',
                icon: const Icon(Icons.keyboard_arrow_down,
                    size: 30, color: Colors.white),
                underline: const SizedBox(),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black26,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
