import 'package:flutter/material.dart';
import 'package:pharma_app/config/app_theme.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider())
    ],
    child: MyApp(),
  ));
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
