import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_app/config/app_theme.dart';
import 'package:pharma_app/screens/home_screen.dart';
import 'package:pharma_app/screens/splash.dart';
import 'package:pharma_app/widgets/app_bar.dart';
import 'package:pharma_app/widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MyBottomNavigation(),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
