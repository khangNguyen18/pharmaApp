import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/product_detail_screen.dart';
import 'package:pharma_app/services/api.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({super.key});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  //TextEditingController searchController = TextEditingController();
  //final FocusNode _textFocusNode = FocusNode();

  // @override
  // void dispose() {

  //   //_textFocusNode.dispose();
  //   //searchController.dispose();
  //   super.dispose();
  // }

  Future<List<Product>> _searchProducts(String query) async {
    if (query.isEmpty) {
      return [];
    }
    return await Api.searchProduct(query);
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Product>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text == '') {
          return const Iterable<Product>.empty();
        }
        return await _searchProducts(textEditingValue.text);
      },
      displayStringForOption: (Product option) => option.title ?? '',
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        controller = controller;
        return CupertinoSearchTextField(
          controller: controller,
          focusNode: focusNode,
          backgroundColor: Colors.white,
          placeholder:
              'Tên thuốc, triệu chứng, vitamin và thực phẩm chức năng...',
          placeholderStyle: TextStyle(
              fontSize: 14, color: Theme.of(context).colorScheme.primary),
          itemColor: Theme.of(context).colorScheme.primary,
          autocorrect: false,
        );
      },
      optionsViewBuilder: (context, AutocompleteOnSelected<Product> onSelected,
          Iterable<Product> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            //borderOnForeground: true,
            borderRadius: BorderRadius.circular(8.0), // Bo tròn cho Material
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0), // Bo tròn khung
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Vị trí bóng
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final Product option = options.elementAt(index);
                  return Column(
                    children: [
                      ListTile(
                        leading: option.photoUrl != null &&
                                option.photoUrl!.isNotEmpty
                            ? Image.network(option.photoUrl![0],
                                width: 50, height: 50)
                            : Icon(Icons.image, size: 50),
                        title: Text(option.title ?? 'No title'),
                        //subtitle:
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(list: option),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                        // indent: 60, // Để phân cách với hình ảnh
                        // endIndent: 0, // Không có khoảng cách bên phải
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}