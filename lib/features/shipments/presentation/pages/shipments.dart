import 'package:flutter/material.dart';

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
        body: const TabBarView(
          children: <Widget>[
            // Content for the 'Active' tab
            Center(child: Text('Tab 1 Content')),
            Center(child: Text('Tab 2 Content')),
            Center(child: Text('Tab 3 Content')),
            Center(child: Text('Tab 4 Content')),
            Center(child: Text('Tab 5 Content')),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: customAppBar(context, 'Shipments'),
    //   body: const Text('Shipments'),
    // );
  }
}
