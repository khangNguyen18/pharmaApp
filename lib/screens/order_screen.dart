import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/order_tabs/processing_tab.dart';
import 'package:pharma_app/widgets/bottom_navigation.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 120,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: TextComponent(
              text: 'Lịch sử đơn hàng',
              isTitle: true,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 65,
              child: TabBar(
                dividerHeight: 5,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 22),
                tabs: [
                  TextComponent(
                    text: 'Đang xử lý',
                    size: 20,
                  ),
                  TextComponent(
                    text: 'Đang vận chuyển',
                    size: 20,
                  ),
                  TextComponent(
                    text: 'Đã giao hàng',
                    size: 20,
                  ),
                  TextComponent(
                    text: 'Đã huỷ',
                    size: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProcessingTab(),
                  Container(
                    child: TextComponent(text: '2'),
                  ),
                  Container(
                    child: TextComponent(text: '3'),
                  ),
                  Container(
                    child: TextComponent(text: '4'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
