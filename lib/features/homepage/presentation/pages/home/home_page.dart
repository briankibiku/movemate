import 'package:flutter/material.dart';
import 'package:movemate/config/theme/theme.dart';
import 'package:movemate/features/calculator/presentation/pages/calculator.dart';
import 'package:movemate/features/homepage/presentation/widgets/freight_management_widget.dart';
import 'package:movemate/features/homepage/presentation/widgets/shipments_tracking_widget.dart';
import 'package:movemate/features/profile/presentation/pages/profile.dart';
import 'package:movemate/features/shipments/presentation/pages/shipments.dart';

import '../../../../../config/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(3.0, 02.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Container(
        color: const Color(0xFFF9F9F9),
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SlideTransition(
              position: _animation,
              child: const ShipmentsTrackingWidget(),
            ),
            const SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _animation,
              child: const FreightManagementWidget(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _buildAppbar(context) {
    return AppBar(
      title: _userDetails(),
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff493391),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: const Color(0xff493391),
          child: Hero(tag: 'search-bar-widget', child: _searchInput(context)),
        ),
      ),
    );
  }

  _searchInput(context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.searchPageRoute, arguments: '');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      hintText: 'Enter the recipient number ...',
                      border: InputBorder.none,
                      labelStyle: AppTextStyles.metaTextStyle),
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xFFF37A1F),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: const Icon(
                  Icons.adf_scanner_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _userDetails() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1621624666561-84d0107001dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
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
                          color: Colors.grey,
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
                        color: Colors.white,
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
