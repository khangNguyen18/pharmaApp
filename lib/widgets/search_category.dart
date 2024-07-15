import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/components/text_component.dart';
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
          child: Container(
            margin: EdgeInsets.only(top: 5),
            width: 420,
            height: 500,
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
                final Product option = new Product(
                    options.elementAt(index).id,
                    options.elementAt(index).title,
                    options.elementAt(index).description,
                    options.elementAt(index).photoUrl,
                    options.elementAt(index).sold,
                    options.elementAt(index).discount,
                    options.elementAt(index).price,
                    options.elementAt(index).categories,
                    options.elementAt(index).subCategories,
                    options.elementAt(index).subSubCategories,
                    options.elementAt(index).indication,
                    options.elementAt(index).contraindication,
                    options.elementAt(index).dosage,
                    options.elementAt(index).uses,
                    [options.elementAt(index).activeElement![index]],
                    options.elementAt(index).producer,
                    options.elementAt(index).packing,
                    options.elementAt(index).sideEffect,
                    options.elementAt(index).careFul,
                    options.elementAt(index).drugInteractions,
                    options.elementAt(index).ageOfUse,
                    options.elementAt(index).genderOfUse,
                    options.elementAt(index).using,
                    options.elementAt(index).recommendation,
                    options.elementAt(index).preserve,
                    options.elementAt(index).unit);
                return Column(
                  children: [
                    ListTile(
                      leading:
                          option.photoUrl != null && option.photoUrl!.isNotEmpty
                              ? Image.network(option.photoUrl![0],
                                  width: 50, height: 50)
                              : Icon(Icons.image, size: 50),
                      title: Text(option.title ?? 'No title'),
                      //subtitle:
                      onTap: () {
                        print(option.price);
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
                      thickness: 0.5,
                      color: Color.fromARGB(255, 181, 181, 181),
                      indent: 15, // Để phân cách với hình ảnh
                      endIndent: 15, // Không có khoảng cách bên phải
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
