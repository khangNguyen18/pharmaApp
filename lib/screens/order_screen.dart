import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pharma_app/widgets/bottom_navigation.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Đã xử lý',
    ),
    Tab(
      text: 'Đã đóng gói',
    ),
    Tab(
      text: 'Đang vân chuyển',
    ),
    Tab(
      text: 'Đã giao',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Lịch sử đơn hàng', style: TextStyle(fontSize: 18)),
          centerTitle: true,
          bottom: const TabBar(
            tabs: myTabs,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 60),
          ),
        ),
      ),
    );
  }
}
