import 'package:flutter/material.dart';
import 'package:movemate/features/homepage/presentation/pages/home/home_page.dart';

import 'config/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: const HomePage());
  }
}
