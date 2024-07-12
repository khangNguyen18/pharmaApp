import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/button_component.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                text: 'dang******2906@gmail.com',
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
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonComponent(
                onTap: () {},
                content: TextComponent(
                  text: 'Xác minh',
                  size: 30,
                  color: Colors.white,
                ),
                widthSize: 375,
                radius: 10,
                colorBackground: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextComponent(text: 'Bạn chưa nhận được OTP?'),
                  GestureDetector(
                    onTap: () {},
                    child: TextComponent(
                      text: ' Gửi lại',
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
