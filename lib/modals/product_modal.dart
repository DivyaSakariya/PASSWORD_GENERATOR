import 'package:get/get.dart';

class ProductModal {
  int id;
  String title;
  String description;
  int price;
  dynamic discountPercentage;
  dynamic rating;
  int stock;
  String brand;
  String category;
  String thumbnailImg;
  List images;
  RxInt qty = 1.obs;

  ProductModal(
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnailImg,
    this.images,
  );

  factory ProductModal.fromMap({required Map data}) {
    return ProductModal(
      data['id'],
      data['title'],
      data['description'],
      data['price'],
      data['discountPercentage'],
      data['rating'],
      data['stock'],
      data['brand'],
      data['category'],
      data['thumbnail'],
      data['images'],
    );
  }
}
