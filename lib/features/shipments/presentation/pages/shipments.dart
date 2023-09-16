import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/features/shipments/presentation/widgets/progress_indicator_widget.dart';

class Shipments extends StatelessWidget {
  const Shipments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shipments',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff493391),
          bottom: TabBar(
            indicatorColor: const Color(0xFFF37A1F),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Row(
                  children: [
                    const Text('All'),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF37A1F),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const Center(child: Text('15')),
                    )
                  ],
                ),
              ),
              const Tab(text: 'Completed'),
              const Tab(text: 'In progress'),
              const Tab(text: 'Pending Order'),
              const Tab(text: 'Cancelled'),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Content for the 'Active' tab
            Container(
              color: const Color(0xFFF9F9F9),
              // margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shipments',
                    style: AppTextStyles.mainHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 150,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ShippingStatusIndicatorWidget(
                                      icon: Icon(
                                        Icons.update,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                      status: 'In-progress',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Arrivign today',
                                                  style: AppTextStyles
                                                      .mainHeadingTextStyle,
                                                ),
                                                Text(
                                                  'Your delivery #numbers from is arriving today',
                                                  style: AppTextStyles
                                                      .metaDataTextStyle,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '\$1400 USD',
                                              style: AppTextStyles
                                                  .currencyTextStyle,
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/images/package.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        })),
                  )
                ],
              ),
            ),
            const Center(child: Text('Tab 2 Content')),
            const Center(child: Text('Tab 3 Content')),
            const Center(child: Text('Tab 4 Content')),
            const Center(child: Text('Tab 5 Content')),
          ],
        ),
      ),
    );
  }
}
