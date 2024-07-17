import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:pharma_app/services/api.dart';
import 'package:provider/provider.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

bool _isVisible = false;
final _formSignInKey = GlobalKey<FormState>();

class _UpdatePasswordState extends State<UpdatePassword> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();
  int? groupValue;

  var checkUpdate = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: TextComponent(
            text: 'Thông tin cá nhân',
            isTitle: true,
            color: Colors.white,
          ),
          centerTitle: true,
          leading: IconComponent(
            onIconPress: () {
              Navigator.pop(context);
            },
            icon: const Icon(IconlyLight.arrow_left_2),
            iconColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextComponent(
                        text: "${user.name} ",
                        size: 20,
                        color: Colors.grey,
                      ),
                      TextComponent(
                        text: "●",
                        size: 10,
                        color: Colors.grey,
                      ),
                      TextComponent(
                        text: " Pharmatown",
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  TextComponent(
                    text: 'Đổi mật khẩu',
                    size: 44,
                    weight: FontWeight.w700,
                  ),
                  TextComponent(
                      text:
                          "Gợi ý: Mật khẩu của bạn nên có 6 ký tự, đồng thời bao gồm cả chữ số, chữ cái và ký tự đặc biệt (!@%)."),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formSignInKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 1.0,
                            ),
                            Column(
                              children: [
                                TextFormField(
                                  controller: oldPasswordController,
                                  obscureText: !_isVisible,
                                  obscuringCharacter: '*',
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isVisible = !_isVisible;
                                        });
                                      },
                                      icon: _isVisible
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    label: const Text('Mật khẩu hiện tại'),
                                    hintText: 'Mật khẩu hiện tại',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black12, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black26, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: newPasswordController,
                                  obscureText: !_isVisible,
                                  obscuringCharacter: '*',
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isVisible = !_isVisible;
                                        });
                                      },
                                      icon: _isVisible
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    label: const Text('Mật khẩu mới'),
                                    hintText: 'Mật khẩu mới',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black12, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black26, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: reNewPasswordController,
                                  obscureText: !_isVisible,
                                  obscuringCharacter: '*',
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isVisible = !_isVisible;
                                        });
                                      },
                                      icon: _isVisible
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    label: const Text('Nhập lại mật khẩu mới'),
                                    hintText: 'Nhập lại mật khẩu mới',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black12, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .black26, // Default border color
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(1);
                    },
                    child: TextComponent(
                      text: 'Quên mật khẩu?',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: groupValue,
                        toggleable: true,
                        onChanged: (int? value) async {
                          setState(() {
                            groupValue = value;
                          });
                        },
                      ),
                      TextComponent(
                        text: 'Đăng xuất khỏi thiết bị',
                        size: 24,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              fixedSize: (const Size(double.infinity, 50)),
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              if (newPasswordController.text.isNotEmpty &&
                  newPasswordController.text != "") {
                var data = {
                  "id": user.id,
                  "oldPassword": oldPasswordController.text,
                  "password": newPasswordController.text
                };
                checkUpdate = await Api.updateUser(data, context);
              }
              if (checkUpdate) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Loading...'),
                  ),
                );
                if (groupValue == 0) {
                  await Api.signOut(context);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password incorrect')),
                );
              }
            },
            child: TextComponent(
              text: 'Lưu',
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
