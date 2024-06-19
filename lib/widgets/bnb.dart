import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class AppBNB extends StatelessWidget {
  const AppBNB({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return NavigationView(
      onChangePage: (_) {},
      curve: Curves.fastEaseInToSlowEaseOut,
      durationAnimation: const Duration(milliseconds: 400),
      backgroundColor: theme.scaffoldBackgroundColor,
      color: theme.primaryColor,
      borderTopColor: theme.primaryColor,
      items: [
        ItemNavigationView(
          childAfter: Column(
            children: [
              Icon(
                IconlyLight.profile,
                color: theme.primaryColor,
                size: 30,
              ),
              Text(
                'Cá nhân',
                style: TextStyle(color: theme.primaryColor),
              ),
            ],
          ),
          childBefore: Icon(
            IconlyLight.profile,
            color: theme.dialogBackgroundColor,
            size: 30,
          ),
        ),
        ItemNavigationView(
          childAfter: Column(
            children: [
              ImageIcon(
                AssetImage("assets/icons/order.png"),
                color: theme.primaryColor,
                size: 30,
              ),
              Text(
                'Đơn hàng',
                style: TextStyle(color: theme.primaryColor),
              ),
            ],
          ),
          childBefore: ImageIcon(
            AssetImage("assets/icons/order.png"),
            color: theme.dialogBackgroundColor,
            size: 30,
          ),
        ),
        ItemNavigationView(
          childAfter: Column(
            children: [
              ImageIcon(
                AssetImage("assets/icons/support.png"),
                color: theme.primaryColor,
                size: 30,
              ),
              Text(
                'Hỗ trợ',
                style: TextStyle(color: theme.primaryColor),
              ),
            ],
          ),
          childBefore: ImageIcon(
            AssetImage("assets/icons/support.png"),
            color: theme.dialogBackgroundColor,
            size: 45,
          ),
        ),
        ItemNavigationView(
          childAfter: Column(
            children: [
              ImageIcon(
                AssetImage("assets/icons/category.png"),
                color: theme.primaryColor,
                size: 25,
              ),
              Text(
                'Danh mục',
                style: TextStyle(color: theme.primaryColor),
              ),
            ],
          ),
          childBefore: ImageIcon(
            AssetImage("assets/icons/category.png"),
            color: theme.dialogBackgroundColor,
            size: 25,
          ),
        ),
        ItemNavigationView(
          childAfter: Column(
            children: [
              ImageIcon(
                AssetImage("assets/icons/home.png"),
                color: theme.primaryColor,
                size: 30,
              ),
              Text(
                'Trang chủ',
                style: TextStyle(color: theme.primaryColor),
              ),
            ],
          ),
          childBefore: ImageIcon(
            AssetImage("assets/icons/home.png"),
            color: theme.dialogBackgroundColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
