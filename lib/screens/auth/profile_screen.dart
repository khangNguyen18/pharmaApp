import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/button_component.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/profile_option_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/provider/cart_provider.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:pharma_app/screens/auth/update_info.dart';
import 'package:pharma_app/screens/auth/verification_screen.dart';
import 'package:pharma_app/screens/category_screen.dart';
import 'package:pharma_app/screens/discount_screen.dart';
import 'package:pharma_app/screens/order_screen.dart';
import 'package:pharma_app/screens/support_screen.dart';
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
        toolbarHeight: 120,
        shadowColor: Colors.black,
        elevation: 5.0,
        title: user.email.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextComponent(
                  text: "Cá nhân",
                  isTitle: true,
                  color: Colors.white,
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.profile,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    TextComponent(
                      text: user.email != "" && user.email.isNotEmpty
                          ? user.name.toString()
                          : "Khong co gi het",
                      weight: FontWeight.bold,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
        centerTitle: user.email.isNotEmpty ? false : true,
        actions: [
          user.email.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 35, right: 20),
                  child: IconComponent(
                    icon: Icon(IconlyLight.edit_square),
                    onIconPress: () {},
                  ),
                )
              : Container()
        ],
      ),
      body: ListView(
        children: [
          if (user.email == "" && user.email.isEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: TextComponent(
                    text: 'Chào mừng đến Pharma Town',
                    weight: FontWeight.bold,
                    isTitle: true,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const Text(
                    'Hãy đăng nhập để được hưởng các đặc quyền dành riêng cho thành viên',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "MarkaziText-Regular",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
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
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen()));
                  },
                  text: 'Danh mục sản phẩm',
                  icon: Icon(
                    IconlyLight.category,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SupportScreen()));
                  },
                  text: 'Hỗ trợ khách hàng',
                  icon: ImageIcon(
                    AssetImage('assets/icons/support.png'),
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {},
                  text: 'Hệ thống cửa hàng',
                  icon: Icon(
                    IconlyLight.location,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {},
                  text: 'Về chúng tôi',
                  icon: Icon(
                    IconlyLight.more_circle,
                    size: 30,
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                  },
                  text: 'Đơn hàng của tôi',
                  icon: Icon(
                    IconlyLight.paper,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateInfo(
                                  name: user.name,
                                )));
                  },
                  text: 'Chỉnh sửa thông tin',
                  icon: Icon(
                    IconlyLight.info_circle,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscountScreen()));
                  },
                  text: 'Mã giảm giá',
                  icon: Icon(
                    IconlyLight.location,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 30),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen()));
                  },
                  text: 'Danh mục sản phẩm',
                  icon: Icon(
                    IconlyLight.category,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SupportScreen()));
                  },
                  text: 'Hỗ trợ khách hàng',
                  icon: ImageIcon(
                    AssetImage('assets/icons/support.png'),
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () async {
                    await Api.getCart(user.id, context);
                  },
                  text: 'Hệ thống cửa hàng',
                  icon: Icon(
                    IconlyLight.location,
                    size: 30,
                  ),
                ),
                ProfileOptionComponent(
                  onTap: () {},
                  text: 'Về chúng tôi',
                  icon: Icon(
                    IconlyLight.more_circle,
                    size: 30,
                  ),
                ),
              ],
            ),

          // Column(
          //   children: [
          //     Container(
          //       color: Color.fromARGB(52, 171, 171, 171),
          //       height: 5,
          //       width: 1000,
          //     ),
          //     const SizedBox(height: 10),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         OutlinedButton(
          //           onPressed: () {},
          //           style: OutlinedButton.styleFrom(
          //               side: BorderSide(color: Colors.transparent)),
          //           child: Container(
          //             alignment: Alignment.center,
          //             width: 80,
          //             height: 100,
          //             child: const Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.max,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Icon(
          //                   IconlyLight.location,
          //                   color: Colors.black,
          //                   size: 50,
          //                 ),
          //                 Text(
          //                   'Cửa hàng',
          //                   style: TextStyle(color: Colors.black, fontSize: 17),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         OutlinedButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => VerificationScreen()));
          //           },
          //           style: OutlinedButton.styleFrom(
          //               side: BorderSide(color: Colors.transparent)),
          //           child: Container(
          //             alignment: Alignment.center,
          //             width: 80,
          //             height: 100,
          //             child: const Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.max,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Icon(
          //                   IconlyLight.discovery,
          //                   color: Colors.black,
          //                   size: 50,
          //                 ),
          //                 Text(
          //                   'Ngôn ngữ',
          //                   style: TextStyle(color: Colors.black, fontSize: 17),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         OutlinedButton(
          //           onPressed: () {},
          //           style: OutlinedButton.styleFrom(
          //               side: BorderSide(color: Colors.transparent)),
          //           child: Container(
          //             alignment: Alignment.center,
          //             width: 80, //nhớ chỉn
          //             height: 100,
          //             child: const Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.max,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Icon(
          //                   IconlyLight.setting,
          //                   color: Colors.black,
          //                   size: 50,
          //                 ),
          //                 Text(
          //                   'Cài đặt',
          //                   style: TextStyle(color: Colors.black, fontSize: 17),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 30,
          ),
          if (user.email != "" && user.email.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: ElevatedButton(
                onPressed: () async {
                  await Api.signOut(context);
                },
                child: TextComponent(
                  text: 'Đăng xuất',
                  color: Colors.white,
                  size: 25,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
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
