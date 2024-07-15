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
import 'package:provider/provider.dart';

class UpdateInfo extends StatefulWidget {
  UpdateInfo({super.key, required this.name});
  String name;

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

bool _isVisible = false;
final _formSignInKey = GlobalKey<FormState>();

class _UpdateInfoState extends State<UpdateInfo> {
  GlobalKey _genderFieldKey = GlobalKey();
  GlobalKey _cityFieldKey = GlobalKey();
  DateTime? _selectedDate;
  TextEditingController _genderController = TextEditingController(text: 'Nam');
  TextEditingController _cityController = TextEditingController();

  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();

  bool _showMoreAddress = false;
  bool _showMorePass = false;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(1900);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: _selectedDate ??
          now, // Sử dụng _selectedDate hoặc ngày hiện tại nếu chưa có _selectedDate
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   toolbarHeight: 75,
        //   backgroundColor: Theme.of(context).colorScheme.primary,
        //   title: TextComponent(
        //     text: 'Cập nhật thông tin',
        //     isTitle: true,
        //     color: Colors.white,
        //   ),
        //   automaticallyImplyLeading: false,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: FaIcon(FontAwesomeIcons.arrowLeft),
        //     style: IconButton.styleFrom(foregroundColor: Colors.white),
        //   ),
        // ),
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
            icon: Icon(IconlyLight.arrow_left_2),
            iconColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 45,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://i.pinimg.com/236x/85/43/a4/8543a4f149305799fd122e882b3c4a80.jpg",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: GestureDetector(
                  child: TextComponent(
                text: 'Cập nhật ảnh',
                size: 20,
              )),
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
                          initialValue: user.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập họ và tên';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text('Họ và tên'),
                            hintText: 'Họ và tên',
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(66, 0, 0, 0),
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
                          initialValue: user.email,
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Vui lòng nhập số điện thoại';
                          //   }
                          //   return null;
                          // },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            label: const Text('Số điện thoại'),
                            hintText: 'Số điện thoại',
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
                              width: 215,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onTap: _presentDatePicker,
                                      readOnly: true,
                                      controller: TextEditingController(
                                        text: _selectedDate != null
                                            ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                            : '',
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Vui lòng nhập số điện thoại';
                                      //   }
                                      //   return null;
                                      // },
                                      decoration: InputDecoration(
                                        label: const Text('Ngày sinh'),
                                        hintText: 'dd/mm/yyyy',
                                        hintStyle: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _presentDatePicker(),
                                    icon: Icon(IconlyLight.calendar),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onTap: () {
                                        _showGenderMenu(context);
                                      },
                                      key: _genderFieldKey,

                                      controller: _genderController,
                                      readOnly: true,
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Vui lòng nhập số điện thoại';
                                      //   }
                                      //   return null;
                                      // },
                                      decoration: InputDecoration(
                                        label: const Text('Giới tính'),
                                        hintText: 'Giới tính',
                                        hintStyle: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _showGenderMenu(context);
                                    },
                                    icon: Icon(IconlyLight.arrow_down_circle),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _showMoreAddress = !_showMoreAddress;
                              });
                            },
                            child: TextComponent(
                              text: 'Cập nhật địa chỉ',
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        if (_showMoreAddress)
                          Column(
                            children: [
                              Stack(
                                children: [
                                  TextFormField(
                                    key: _cityFieldKey,
                                    onTap: () {
                                      _showCityMenu(context);
                                    },
                                    controller: _cityController,
                                    readOnly: true,
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
                                          color: Colors
                                              .black26, // Default border color
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
                                  Positioned(
                                    right: 5,
                                    bottom: 5,
                                    child: IconButton(
                                      onPressed: () {
                                        _showCityMenu(context);
                                      },
                                      icon: Icon(IconlyLight.arrow_down_circle),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      onTap: () {},

                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Vui lòng nhập số điện thoại';
                                      //   }
                                      //   return null;
                                      // },
                                      decoration: InputDecoration(
                                        label: const Text('Quận'),
                                        hintText: 'Quận',
                                        hintStyle: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      onTap: () {},
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Vui lòng nhập số điện thoại';
                                      //   }
                                      //   return null;
                                      // },
                                      decoration: InputDecoration(
                                        label: const Text('Phường'),
                                        hintText: 'Phường',
                                        hintStyle: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .black26, // Default border color
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      color: Colors
                                          .black26, // Default border color
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
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _showMorePass = !_showMorePass;
                              });
                            },
                            child: TextComponent(
                              text: 'Cập nhật mật khẩu',
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        if (_showMorePass)
                          Column(
                            children: [
                              TextFormField(
                                controller: oldPasswordController,
                                obscureText: _isVisible,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
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
                                obscureText: _isVisible,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
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
                                obscureText: _isVisible,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
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
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
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

  void _showGenderMenu(BuildContext context) async {
    final RenderBox genderFieldRenderBox =
        _genderFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Offset genderFieldOffset =
        genderFieldRenderBox.localToGlobal(Offset.zero);
    final double genderFieldWidth = genderFieldRenderBox.size.width;
    final double genderFieldHeight = genderFieldRenderBox.size.height;

    final RelativeRect position = RelativeRect.fromLTRB(
      genderFieldOffset.dx,
      genderFieldOffset.dy + genderFieldHeight,
      genderFieldOffset.dx + genderFieldWidth,
      genderFieldOffset.dy +
          genderFieldHeight +
          10, // Vị trí dưới phần chọn giới tính
    );

    final String? newValue = await showMenu<String>(
      context: context,
      position: position,
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Nam',
          child: Text('Nam'),
        ),
        PopupMenuItem<String>(
          value: 'Nữ',
          child: Text('Nữ'),
        ),
      ],
    );

    if (newValue != null) {
      setState(() {
        _genderController.text = newValue;
      });
    }
  }

  List<String> cities = [
    'TP. Hà Nội',
    'TP. Hồ Chí Minh',
    'Đà Nẵng',
    'Hải Phòng',
    'Cần Thơ',
    'Nha Trang',
    'Huế',
    'Vũng Tàu',
    'Đồng Nai',
  ];
  void _showCityMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RenderBox cityFieldRenderBox =
        _cityFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Offset cityFieldOffset =
        cityFieldRenderBox.localToGlobal(Offset.zero);
    final double cityFieldWidth = cityFieldRenderBox.size.width;
    final double cityFieldHeight = cityFieldRenderBox.size.height;

    final RelativeRect position = RelativeRect.fromLTRB(
      cityFieldOffset.dx,
      cityFieldOffset.dy + cityFieldHeight,
      cityFieldOffset.dx + cityFieldWidth,
      cityFieldOffset.dy +
          cityFieldHeight +
          10, // Vị trí dưới phần chọn thành phố
    );

    // Tạo danh sách PopupMenuItem từ danh sách thành phố
    List<PopupMenuEntry<String>> cityItems = cities.map((city) {
      return PopupMenuItem<String>(
        value: city,
        child: Container(
          width: cityFieldWidth,
          child: Text(city),
        ),
      );
    }).toList();

    // Hiển thị menu lựa chọn thành phố
    final String? newValue = await showMenu<String>(
      context: context,
      position: position,
      items: cityItems,
    );

    if (newValue != null) {
      setState(() {
        _cityController.text = newValue;
      });
    }
  }
}
