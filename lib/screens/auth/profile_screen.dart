import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 110,
        shadowColor: Colors.black,
        elevation: 5.0,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {},
                child: TextComponent(
                  text: 'Đăng ký/Đăng nhập',
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 180,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Chào mừng đến Pharma Town',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "MarkaziText-Bold",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Hãy đăng nhập để được hưởng các đặc quyền dành riêng cho thành viên',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "MarkaziText-Regular",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    text: 'Đăng ký/Đăng nhập',
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    size: 16,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                color: Color.fromARGB(52, 171, 171, 171),
                height: 5,
                width: 1000,
              ),
            ],
          )
        ],
      ),
    );
  }
}
