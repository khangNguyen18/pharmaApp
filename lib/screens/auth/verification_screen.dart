import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/button_component.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/services/api.dart';

class VerificationScreen extends StatefulWidget {
  final Map<String, String> data;
  const VerificationScreen({super.key, required this.data});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var number1 = TextEditingController();
  var number2 = TextEditingController();
  var number3 = TextEditingController();
  var number4 = TextEditingController();
  int _timerDuration = 60;
  Timer? _timer;
  var _otp;
  @override
  void initState() {
    super.initState();
    _startTimer();
    _getNewOTP();
  }

  Future<void> _getNewOTP() async {
    _otp = await Api.verification(context, widget.data["email"]!);
  }

  void _startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_timerDuration > 0) {
            _timerDuration--;
          } else {
            _timer?.cancel();
          }
        });
      },
    );
  }

  void _resetTimer() async {
    _timer?.cancel();
    _otp = await Api.verification(context, widget.data["email"]!);
    setState(() {
      _timerDuration = 60;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconComponent(
          icon: const Icon(IconlyLight.arrow_left_2),
          onIconPress: () {
            Navigator.pop(context);
          },
          iconColor: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(50, 205, 205, 205)),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image(
                    image: AssetImage('assets/images/verification.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              TextComponent(
                text: 'Mã xác minh',
                isTitle: true,
              ),
              TextComponent(
                text: 'Chúng tôi đã gửi mã xác minh 4 số tới',
              ),
              TextComponent(
                text: widget.data["email"].toString(),
                weight: FontWeight.bold,
              ),
              //truyền email vô đây
              const SizedBox(height: 50),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        controller: number1,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        controller: number2,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        controller: number3,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: TextFormField(
                        controller: number4,
                        onChanged: (value) async {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (number1.text +
                                  number2.text +
                                  number3.text +
                                  number4.text ==
                              _otp.toString()) {
                            await Api.postRegisterAuth(widget.data, context);
                          } else {
                            print("Failed");
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponent(
                      text: _timerDuration == 0
                          ? "Bạn chưa nhận được mã?"
                          : 'Mã có hiệu lực trong'),
                  GestureDetector(
                    onTap: _timerDuration == 0 ? _resetTimer : null,
                    child: TextComponent(
                      text: _timerDuration == 0
                          ? ' Gửi lại'
                          : ' ($_timerDuration)',
                      color: Theme.of(context).colorScheme.primary,
                      weight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
