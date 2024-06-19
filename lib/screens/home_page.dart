import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharma_app/widgets/app_bar.dart';
import 'package:pharma_app/widgets/bnb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView(
        children: [
          MyAppBar(),

          AppBNB(),
        ],
      ),
    );
  }
}
