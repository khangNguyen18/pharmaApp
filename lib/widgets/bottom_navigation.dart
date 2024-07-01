import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharma_app/config/app_theme.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:pharma_app/screens/auth/profile_screen.dart';
import 'package:pharma_app/screens/category_screen.dart';
import 'package:pharma_app/screens/home_screen.dart';
import 'package:pharma_app/screens/order_screen.dart';
import 'package:pharma_app/screens/support_screen.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _screens = [
    HomeScreen(),
    CategoryScreen(),
    SupportScreen(),
    OrderScreen(),
    ProfileScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 50,
        elevation: 5.0,
        shadowColor: Colors.black,
        onDestinationSelected: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(IconlyLight.home), label: 'Trang chủ'),
          NavigationDestination(
              icon: Icon(IconlyLight.category), label: 'Danh mục'),
          NavigationDestination(
              icon: ImageIcon(AssetImage('assets/icons/support.png')),
              label: 'Hỗ trợ'),
          NavigationDestination(
              icon: Icon(IconlyLight.paper), label: 'Đơn hàng'),
          NavigationDestination(
              icon: Icon(IconlyLight.profile), label: 'Cá nhân'),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
