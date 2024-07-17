import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharma_app/components/icon_component.dart';
import 'package:pharma_app/components/text_component.dart';
import 'package:pharma_app/provider/user_provider.dart';
import 'package:pharma_app/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

class UpdateAddress extends StatefulWidget {
  UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

bool _isVisible = false;
final _formSignInKey = GlobalKey<FormState>();

class _UpdateAddressState extends State<UpdateAddress> {
  TextEditingController _cityController = TextEditingController();

  bool _showMoreAddress = false;
  bool _showMorePass = false;

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
            text: 'Địa chỉ',
            isTitle: true,
            color: Colors.white,
          ),
          centerTitle: true,
          leading: IconComponent(
            onIconPress: () {
              Navigator.pop(context);
            },
            icon: Icon(IconlyLight.arrow_left_2),
            iconColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  children: [
                    TextFormField(
                      onTap: () {},
                      //controller: _cityController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Vui lòng nhập số điện thoại';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        label: const Text('Tỉnh, Thành phố'),
                        hintText: 'Chọn thành phố',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            onTap: () {},
                            decoration: InputDecoration(
                              label: const Text('Quận'),
                              hintText: 'Quận',
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
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            onTap: () {},
                            decoration: InputDecoration(
                              label: const Text('Phường'),
                              hintText: 'Phường',
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: const Text('Địa chỉ nhà'),
                        hintText: 'Địa chỉ nhà',
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              fixedSize: (Size(double.infinity, 50)),
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (_formSignInKey.currentState!.validate() && rememberPassword) {
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

  // List<String> cities = [
  //   'TP. Hà Nội',
  //   'TP. Hồ Chí Minh',
  //   'Đà Nẵng',
  //   'Hải Phòng',
  //   'Cần Thơ',
  //   'Nha Trang',
  //   'Huế',
  //   'Vũng Tàu',
  //   'Đồng Nai',
  // ];
  // void _showCityMenu(BuildContext context) async {
  //   final RenderBox overlay =
  //       Overlay.of(context)!.context.findRenderObject() as RenderBox;
  //   final RenderBox cityFieldRenderBox =
  //       _cityFieldKey.currentContext!.findRenderObject() as RenderBox;
  //   final Offset cityFieldOffset =
  //       cityFieldRenderBox.localToGlobal(Offset.zero);
  //   final double cityFieldWidth = cityFieldRenderBox.size.width;
  //   final double cityFieldHeight = cityFieldRenderBox.size.height;

  //   final RelativeRect position = RelativeRect.fromLTRB(
  //     cityFieldOffset.dx,
  //     cityFieldOffset.dy + cityFieldHeight,
  //     cityFieldOffset.dx + cityFieldWidth,
  //     cityFieldOffset.dy +
  //         cityFieldHeight +
  //         10, // Vị trí dưới phần chọn thành phố
  //   );

  //   // Tạo danh sách PopupMenuItem từ danh sách thành phố
  //   List<PopupMenuEntry<String>> cityItems = cities.map((city) {
  //     return PopupMenuItem<String>(
  //       value: city,
  //       child: Container(
  //         width: cityFieldWidth,
  //         child: Text(city),
  //       ),
  //     );
  //   }).toList();

  //   // Hiển thị menu lựa chọn thành phố
  //   final String? newValue = await showMenu<String>(
  //     context: context,
  //     position: position,
  //     items: cityItems,
  //   );

  //   if (newValue != null) {
  //     setState(() {
  //       _cityController.text = newValue;
  //     });
  //   }
  // }
}
