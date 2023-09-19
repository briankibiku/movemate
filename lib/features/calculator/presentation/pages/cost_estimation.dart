import 'package:flutter/material.dart';
import 'package:movemate/config/routes/routes.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/core/constants/app_strings.dart';

class CostEstimation extends StatefulWidget {
  final String cost;
  const CostEstimation({super.key, required this.cost});

  @override
  State<CostEstimation> createState() => _CostEstimationState();
}

class _CostEstimationState extends State<CostEstimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _count = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final Animation<int> countAnimation = IntTween(
      begin: 0,
      end: 1450,
    ).animate(_controller);

    countAnimation.addListener(() {
      setState(() {
        _count = countAnimation.value;
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppString.moveMateImage,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              AppString.packageImage,
              height: 120,
              width: 120,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppString.totalEstCost,
              style: AppTextStyles.largeBodyTextStyle
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Text(
              '\$ $_count USD ',
              style: AppTextStyles.mediumCurrencyTextStyle
                  .copyWith(color: AppColors.greenColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppString.giveQuoteString,
              style: AppTextStyles.metaDataTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: AppColors.primaryColorLight,
              minWidth: MediaQuery.of(context).size.width,
              height: 46,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeRoute, arguments: '');
              },
              child: const Text(
                AppString.backHome,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
