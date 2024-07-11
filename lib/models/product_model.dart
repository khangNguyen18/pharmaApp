import 'package:pharma_app/models/activeElement_model.dart';

class Product {
  final String? title;
  final String? description;
  final List<String>? photoUrl;
  final int sold;
  final num? discount;
  final String price;
  final List<String>? categories;
  final List<String>? subCategories;
  final List<String>? subSubCategories;
  final List<String>? indication;
  final List<String>? contraindication;
  final List<String>? dosage;
  final List<String>? uses;
  final List<ActiveElementModel>? activeElement;
  final String? producer;
  final String? packing;
  final List<String>? sideEffect;
  final List<String>? careFul;
  final List<String>? drugInteractions;
  final List<String>? ageOfUse;
  final List<String>? genderOfUse;
  final List<String>? using;
  final List<String>? recommendation;
  final List<String>? preserve;
  final String? unit;

  Product(
    this.title,
    this.description,
    this.photoUrl,
    this.sold,
    this.discount,
    this.price,
    this.categories,
    this.subCategories,
    this.subSubCategories,
    this.indication,
    this.contraindication,
    this.dosage,
    this.uses,
    this.activeElement,
    this.producer,
    this.packing,
    this.sideEffect,
    this.careFul,
    this.drugInteractions,
    this.ageOfUse,
    this.genderOfUse,
    this.using,
    this.recommendation,
    this.preserve,
    this.unit,
  );
}
