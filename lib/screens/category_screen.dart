import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _showHintText = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showHintText = _searchController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          _showHintText = _searchController.text.isEmpty;
        });
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160), // Tăng chiều cao của AppBar
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20), // Khoảng trống phía trên tiêu đề
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Danh mục thuốc',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.textsms_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Khoảng trống phía dưới tiêu đề
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xff006769)),
                      hintText:
                          _showHintText ? 'Tên thuốc, triệu chứng, vitamin và thực phẩm chức năng...' : '',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 12),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Đặt giá trị bo tròn cho TextField
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _showHintText = false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), // Khoảng trống phía dưới thanh tìm kiếm để thấy nền xanh của AppBar
              ],
            ),
          ),
        ),
        body: Center(
          child: Text('Nội dung trang danh mục thuốc'),
        ),
      ),
    );
  }
}


