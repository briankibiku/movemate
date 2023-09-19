import 'package:flutter/material.dart';

import '../../data/repository/shipping_category_options.dart';

class MultiSelectOptionsWidget extends StatefulWidget {
  const MultiSelectOptionsWidget({super.key});

  @override
  State<MultiSelectOptionsWidget> createState() =>
      _MultiSelectOptionsWidgetState();
}

class _MultiSelectOptionsWidgetState extends State<MultiSelectOptionsWidget> {
  List<String> options = shippingCategoryOptions;

  Set<String> selectedOptions = <String>{};

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: options.map((option) {
                final isSelected = selectedOptions.contains(option);

                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isSelected
                        ? MaterialStateProperty.all<Color>(Colors.black)
                        : MaterialStateProperty.all<Color>(Colors.white),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(
                        color: Colors.black38,
                        width: 1.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (isSelected) {
                        selectedOptions.remove(option);
                      } else {
                        selectedOptions.add(option);
                      }
                    });
                  },
                  child: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
