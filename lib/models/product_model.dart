class Product {
  final String? title;
  final String? description;
  final String? photoUrl;
  final int? like;
  final num? sold;
  final String price;
  final List<String> categories;
  final DateTime? createAt;

  Product(
      {this.title,
      this.description,
      this.photoUrl,
      this.like,
      this.sold,
      required this.price,
      required this.categories,
      this.createAt});
}
