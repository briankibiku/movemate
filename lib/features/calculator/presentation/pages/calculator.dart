import 'package:flutter/material.dart';

import '../../../homepage/presentation/widgets/shared/bottom_navigation_widget.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Calculator'),
      body: const Text('Calculator'),
    );
  }
}
