import 'package:flutter/material.dart';

import '../../../homepage/presentation/widgets/shared/bottom_navigation_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Profile'),
      body: const Text('Profile'),
    );
  }
}
