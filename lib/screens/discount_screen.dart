import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharma_app/components/discount_card.dart';
import 'package:pharma_app/components/text_component.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
        ),
        title: TextComponent(
          color: Colors.white,
          text: 'Mã khuyến mãi',
          isTitle: true
        ),
      ),
      body: Column(
        children: [
          DiscountCard(),
          DiscountCard(),
        ],
      ),
    );
  }
}