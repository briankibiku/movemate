import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/features/shipments/presentation/widgets/shipments_history_card.dart';

import '../../data/repository/shipments_list.dart';
import '../widgets/shipments_filtered_list_widget.dart';

class Shipments extends StatelessWidget {
  const Shipments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shipment history',
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
              const Tab(text: 'Loading'),
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
            Container(
              color: const Color(0xFFF9F9F9),
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
                        itemCount: shipmentsList.length,
                        itemBuilder: ((context, index) {
                          final shipmentItem = shipmentsList[index];
                          return Column(
                            children: [
                              ShipmentsHistoryCardWidget(
                                  shipment: shipmentItem),
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
            FilteredList(status: 'complete', itemList: shipmentsList),
            FilteredList(status: 'in-progress', itemList: shipmentsList),
            FilteredList(status: 'pending', itemList: shipmentsList),
            FilteredList(status: 'loading', itemList: shipmentsList),
            FilteredList(status: 'cancelled', itemList: shipmentsList),
          ],
        ),
      ),
    );
  }
}
