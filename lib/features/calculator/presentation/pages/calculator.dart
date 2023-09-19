import 'package:flutter/material.dart';
import 'package:movemate/config/routes/routes.dart';
import 'package:movemate/features/calculator/presentation/widgets/package_destination_widget.dart';
import 'package:movemate/features/calculator/presentation/widgets/package_dropdown.dart';

import '../../../../config/theme/theme.dart';
import '../../../homepage/presentation/widgets/shared/bottom_navigation_widget.dart';
import '../widgets/calculator_category_select_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Calculate'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Destination',
              style: AppTextStyles.mainHeadingTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            // package destination widget
            const PackageDestinationWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'Packaging',
                style: AppTextStyles.mainHeadingTextStyle,
              ),
            ),
            Text(
              'What are you sending?',
              style: AppTextStyles.metaDataTextStyle.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            // package dropdown widget
            const PackageDropdownWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'Categories',
                style: AppTextStyles.mainHeadingTextStyle,
              ),
            ),
            Text(
              'What are you sending?',
              style: AppTextStyles.metaDataTextStyle.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            // categories multiselect widget
            const MultiSelectOptionsWidget(),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: AppColors.primaryColorLight,
              minWidth: MediaQuery.of(context).size.width,
              height: 46,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.costEstimationPageRoute,
                  arguments: '400',
                );
              },
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
