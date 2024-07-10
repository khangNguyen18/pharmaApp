import 'package:get/get.dart';
import 'package:pharma_app/models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  //get all images
  List<String> getAllProductImages(Product product) {
    Set<String> images = {};

    images.add(product.photoUrl![0]);

    selectedProductImage.value = product.photoUrl![0];

    //get all images from the Product Model
    if (product.photoUrl != null) {
      images.addAll(product.photoUrl!);
    }

    return images.toList();
  }

  void showEnlargedImage(String image) {
    // Get.to(fullscreenDialog: true, () =>);
  }
}
