import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/models/product_model.dart';
import 'package:pharma_app/screens/product_detail_screen.dart';
import 'package:pharma_app/services/api.dart';

class SearchCategory extends StatefulWidget {
  SearchCategory({super.key});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  TextEditingController? searchController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();

  //late Product list;

  @override
  void dispose() {
    _textFocusNode.dispose();
    searchController!.dispose();
    super.dispose();
  }

  Future<List<Product>> _searchProducts(String query) async {
    if (query.isEmpty) {
      return [];
    }
    return await Api.searchProduct(query);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<Product>(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text == '') {
              return const Iterable<Product>.empty();
            }
            return await _searchProducts(textEditingValue.text);
          },
          displayStringForOption: (Product option) => option.title ?? '',
          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
            searchController = controller;
            return CupertinoSearchTextField(
              controller: controller,
              focusNode: focusNode,
              backgroundColor: Colors.white,
              placeholder: 'Tìm kiếm sản phẩm',
              autocorrect: false,
            );
          },
          onSelected: (Product selection) {
            print('Selected: ${selection.title}');
          },
          optionsViewBuilder: (context,
              AutocompleteOnSelected<Product> onSelected,
              Iterable<Product> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product option = options.elementAt(index);
                      return ListTile(
                        leading: option.photoUrl != null &&
                                option.photoUrl!.isNotEmpty
                            ? Image.network(option.photoUrl![0],
                                width: 50, height: 50)
                            : Icon(Icons.image, size: 50),
                        title: Text(option.title ?? 'No title'),
                        subtitle: Text(option.description ?? 'No description'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(list: option)));
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}