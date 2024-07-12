import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:pharma_app/screens/auth/verification_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        primary: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 110,
        shadowColor: Colors.black,
        elevation: 5.0,
        centerTitle: true,
        title: TextComponent(
          text: "Cá nhân",
          isTitle: true,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          if (user.email == "" && user.email.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextComponent(
                    text: 'Chào mừng đến Pharma Town',
                    weight: FontWeight.bold,
                    isTitle: true,
                    size: 50,
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
                    onPressed: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      );
                      Navigator.push(context, route);
                    },
                    child: TextComponent(
                      text: 'Đăng ký/Đăng nhập',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 100,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            IconlyLight.location,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            'Cửa hàng',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen()));
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 100,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            IconlyLight.discovery,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            'Ngôn ngữ',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80, //nhớ chỉn
                      height: 100,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            IconlyLight.setting,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            'Cài đặt',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (user.email != "" && user.email.isNotEmpty)
            TextButton(
              onPressed: () async {
                await Api.signOut(context);
              },
              child: Text("Đăng xuất"),
            ),
          // TextButton(
          //     onPressed: () async {
          //       print(token);
          //     },
          //     child: Text('Print token')),
        ],
      ),
    );
  }
}
