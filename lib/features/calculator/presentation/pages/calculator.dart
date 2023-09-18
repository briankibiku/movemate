import 'package:flutter/material.dart';
import 'package:movemate/config/routes/routes.dart';

import '../../../homepage/presentation/widgets/shared/bottom_navigation_widget.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Calculator'),
      body: Column(
        children: [
          const Text('Calculator'),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.costEstimationPageRoute,
                arguments: '400',
              );
            },
            child: const Text('Click Me'),
          )
        ],
      ),
    );
  }
}
