import 'package:flutter/material.dart';

class TextDropDownButton extends StatefulWidget {
  const TextDropDownButton({super.key});

  @override
  State<TextDropDownButton> createState() => _TextDropDownButtonState();
}

class _TextDropDownButtonState extends State<TextDropDownButton> {
  String selectedOption = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      icon: const Icon(Icons.arrow_drop_down), // Right arrow icon
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue!;
        });
      },
      items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }
}
