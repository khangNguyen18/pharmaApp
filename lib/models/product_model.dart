class Product {
  final String? title;
  final String? description;
  final List<String>? photoUrl;
  final num? sold;
  final num? discount;
  final String price;
  final List<String> categories;
  final List<String> subCategories;
  final List<String> subSubCategories;
  final List<String>? indication;
  final List<String>? contraindication;
  final List<String>? dosage;
  final List<String>? uses;
  Map<String, dynamic>? activeElement = {
    'title': {'type': 'String'},
    'desc': {
      'type': ['String']
    },
  };
  final String? producer;
  final String? packing;
  final List<String>? sideEffect;
  final List<String>? careFul;
  final List<String>? drugInteraction;
  final List<String>? ageOfUse;
  final List<String>? genderOfUse;
  final List<String>? using;
  final List<String>? recommendation;
  final List<String>? preserve;
  final DateTime? createAt;


  Product(
      {this.title,
      this.description,
      this.photoUrl,
      this.sold,
      this.discount,
      required this.price,
      required this.categories,
      required this.subCategories,
      required this.subSubCategories,
      this.indication,
      this.contraindication,
      this.dosage,
      this.uses,
      this.activeElement,
      this.producer,
      this.packing,
      this.sideEffect,
      this.careFul,
      this.drugInteraction,
      this.ageOfUse,
      this.genderOfUse,
      this.using,
      this.recommendation,
      this.preserve,
      this.createAt});


}
