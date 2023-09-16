import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/features/calculator/presentation/pages/calculator.dart';
import 'package:movemate/features/homepage/presentation/widgets/freight_management_widget.dart';
import 'package:movemate/features/homepage/presentation/widgets/shipments_tracking_widget.dart';
import 'package:movemate/features/profile/presentation/pages/profile.dart';
import 'package:movemate/features/shipments/presentation/pages/shipments.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Define your pages/screens here
  final List<Widget> _pages = [
    const HomePageContent(),
    const Calculator(),
    const Shipments(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Color,
        selectedItemColor: const Color(0xff493391),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Shipments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      // _homePageContent(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        color: const Color(0xFFF9F9F9),
        margin: const EdgeInsets.all(10),
        child: const Column(
          children: [
            ShipmentsTrackingWidget(),
            SizedBox(
              height: 20,
            ),
            FreightManagementWidget()
          ],
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
        title: _userDetails(),
        backgroundColor: const Color(0xff493391),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: const Color(0xff493391),
            child: _searchInput(),
          ),
        ));
  }

  _searchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey, // Icon color
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter the recipient number ...',
                  border: InputBorder.none,
                  labelStyle: AppTextStyles.metaTextStyle),
            ),
          ),
          const SizedBox(width: 8.0),
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Color(0xFFF37A1F),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Icon(
                Icons.adf_scanner_rounded,
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userDetails() {
    return Row(
      children: [
        // Left: Avatar
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1621624666561-84d0107001dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80', // Replace with the actual URL
          ),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Transform.rotate(
                        angle: 45,
                        child: const Icon(
                          Icons.navigation_sharp,
                          size: 16,
                          color: Colors.grey, // Icon color
                        ),
                      ),
                      const Text(
                        'Your location',
                        style: AppTextStyles.metaDataTextStyle,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Werthiemer, Illinions',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white, // Icon color
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black87,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
