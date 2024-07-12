import 'package:flutter/material.dart';
import 'package:pharma_app/components/button_component.dart';
import 'package:pharma_app/components/button_filter_component.dart';
import 'package:pharma_app/components/text_component.dart';

class FilterOverlay extends StatefulWidget {
  const FilterOverlay({super.key});

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bộ lọc',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Khoảng giá',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonFilterComponent(
                            content: '0đ - 100.000đ', onTap: () {}),
                        ButtonFilterComponent(
                            content: '100.000đ - 300.000đ', onTap: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonFilterComponent(
                            content: '300.000đ - 500.000đ', onTap: () {}),
                        ButtonFilterComponent(
                            content: 'Trên 500.000đ', onTap: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 56, 47, 47),
                    ),
                    const Text(
                      'Loại thuốc',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonFilterComponent(
                            content: 'Thuốc ngừa thai', onTap: () {}),
                        ButtonFilterComponent(
                            content: 'Thuốc dị ứng', onTap: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonFilterComponent(
                            content: 'Thuốc kháng viêm', onTap: () {}),
                        ButtonFilterComponent(
                            content: 'Thuốc cảm lạnh', onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonComponent(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    content: TextComponent(text: 'Huỷ',),
                    color: Colors.black,
                    colorBackground: Color(0xffF5F5F5),
                  ),
                  ButtonComponent(onTap: () {}, content: TextComponent(text: 'Xác nhận',))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
