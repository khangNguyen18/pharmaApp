import 'package:flutter/material.dart';
import 'package:pharma_app/config/app_theme.dart';
import 'package:pharma_app/widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MyBottomNavigation(),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: kColorScheme),
      // theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
