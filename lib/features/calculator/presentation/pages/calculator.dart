import 'package:flutter/material.dart';
import 'package:movemate/config/routes/routes.dart';

import '../../../../config/theme/theme.dart';
import '../../../homepage/presentation/widgets/shared/bottom_navigation_widget.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Calculator'),
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
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: 'Sender location',
                        prefixIcon: Icon(Icons.outbox_outlined),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: 'Receiver location',
                        prefixIcon: Icon(Icons.inbox_outlined),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: 'Approx weight',
                        prefixIcon: Icon(Icons.scale_outlined),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('data'),
                ],
              ),
            ),
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
