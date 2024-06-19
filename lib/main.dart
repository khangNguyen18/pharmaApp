import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_app/config/app_theme.dart';
import 'package:pharma_app/screens/splash.dart';

void main() {
  runApp(
    MaterialApp(
      home: const SplashScreen(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    ),
  );
}