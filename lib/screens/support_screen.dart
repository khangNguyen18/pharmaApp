import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/components/title_component.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TitleComponent(
          text: 'Hỗ trợ',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: 280,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
            child: Stack(children: [
            Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: const Color.fromARGB(255, 238, 255, 241),
              ),
              child: Image(
                image: AssetImage('assets/images/support.png'),
              ),
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleComponent(
                          text: 'Chat với PharmaTown',
                          color: Colors.black,
                        ),
                        Text('Hỗ trợ nhanh chóng'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: TextComponent(
                        text: 'Chat ngay',
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
