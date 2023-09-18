import 'package:flutter/material.dart';
import 'package:movemate/config/routes/routes.dart';
import 'package:movemate/features/homepage/presentation/pages/home/home_page.dart';
import 'package:movemate/features/search/presentation/pages/search_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.searchPageRoute:
        return MaterialPageRoute(builder: (_) => const ShipmentsSearchPage());
      default:
        // Handle unknown routes or show an error page
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Route not found!'),
            ),
          ),
        );
    }
  }
}
