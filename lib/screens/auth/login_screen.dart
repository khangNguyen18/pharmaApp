import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/screens/auth/register_screen.dart';
import 'package:pharma_app/services/api.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ));

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formSignInKey = GlobalKey<FormState>();
bool rememberPassword = true;
bool _isVisible = false;
// void _submitLoginData() {
//   showDialog(context: context, builder: builder)
// }

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
      ),
      body: ListView(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Stack(
              children: [
                Positioned(
                  child: IconComponent(
                    icon: const Icon(IconlyLight.arrow_left_2),
                    onIconPress: () {
                      Navigator.pop(context);
                    },
                    iconColor: Colors.white,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/logo_white_small.png'),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 240),
                      child: Center(
                        child: Text(
                          "Xin chào!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
              Positioned(
                top: 49,
                left: 25,
                child: FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Vui lòng nhập email của bạn để tiếp tục",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
                child: FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isVisible,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập mật khẩu';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            label: const Text('Mật khẩu'),
                            hintText: 'Mật khẩu',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black26, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Text(
                                'Quên mật khẩu?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(0, 103, 105, 1)),
                            onPressed: () {
                              var data = {
                                "email": emailController.text,
                                "password": passwordController.text,
                              };
                              Api.postLoginAuth(data);
                              if (_formSignInKey.currentState!.validate() &&
                                  rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                              } else if (!rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data'),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Đăng nhập',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              child: Text(
                                'Hoặc',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.facebookF,
                                size: 35,
                                color: Color.fromRGBO(66, 103, 178, 1),
                              ),
                              FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                size: 40,
                                color: Colors.red,
                              ),
                              FaIcon(
                                FontAwesomeIcons.apple,
                                size: 40,
                                color: Colors.black,
                              ),
                              FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 40,
                                color: Color.fromRGBO(29, 161, 242, 1),
                              ),
                            ]),
                        const SizedBox(
                          height: 25.0,
                        ),
                        // don't have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Bạn chưa có tài khoản? ',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => const RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 103, 105, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
