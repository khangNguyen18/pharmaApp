import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/screens/auth/verification_screen.dart';
import 'package:pharma_app/services/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final _formSignInKey = GlobalKey<FormState>();
bool _isVisible = false;
bool _isVisible2 = false;
bool rememberPassword = true;

class _RegisterScreenState extends State<RegisterScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Stack(
                children: [
                  Positioned(
                    child: IconComponent(
                      icon: Icon(IconlyLight.arrow_left_2),
                      onIconPress: () {
                        Navigator.pop(context);
                      },
                      iconColor: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/images/logo_white_small.png'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 200),
                      child: Center(
                        child: Text(
                          "Đăng ký ngay",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 1.0,
                          ),
                          TextFormField(
                            controller: fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập họ và tên';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Họ và tên'),
                              hintText: 'Họ và tên',
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
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập email';
                              }
                              else if(!isValidEmail(value)) {
                                return 'Sai định dạng email';
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
                            obscureText: !_isVisible,
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
                          TextFormField(
                            controller: rePasswordController,
                            obscureText: !_isVisible2,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mật khẩu';
                              } else if(value != passwordController.text){
                                return 'Mật khẩu nhập lại không khớp';
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible2 = !_isVisible2;
                                    });
                                  },
                                  icon: _isVisible2
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              label: const Text('Nhập lại mật khẩu'),
                              hintText: 'Nhập lại mật khẩu',
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
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(0, 103, 105, 1)),
                              onPressed: () async {
                                if (_formSignInKey.currentState!.validate() &&
                                    rememberPassword) {
                                  var data = {
                                    "fullname": fullNameController.text,
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                  };

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => VerificationScreen(
                                        data: data,
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                    ),
                                  );
                                } else if (!rememberPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please agree to the processing of personal data')),
                                  );
                                }
                              },
                              child: const Text(
                                'Đăng ký',
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
                                  'Hoặc đăng ký',
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
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
