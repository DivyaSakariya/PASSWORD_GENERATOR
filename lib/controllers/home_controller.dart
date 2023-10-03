import 'dart:developer';

import 'package:get/get.dart';

import '../helpers/api_helper.dart';
import '../modals/product_modal.dart';

class HomeController extends GetxController {
  RxInt amount = 0.obs;
  RxList<ProductModal> allCartProducts = <ProductModal>[].obs;
  RxList<ProductModal> allProducts = <ProductModal>[].obs;
  RxInt finalAmount = 0.obs;

  Future<List<ProductModal>> getAllProducts() async {
    allProducts(await ApiHelper.apiHelper.getProduct());
    return allProducts;
  }

  addCart({required ProductModal productModal}) {
    if (allCartProducts.contains(productModal)) {
      return Get.snackbar(
        "Already Added !!",
        "Done",
      );
    } else {
      allCartProducts.add(productModal);
      return Get.snackbar(
        "Added...",
        "Thank You !!",
      );
    }
  }

  totalAmount() {
    amount = 0.obs;
    for (var element in allCartProducts) {
      finalAmount.value += element.price;
      finalAmount.value *= element.qty.toInt();
      amount.value += finalAmount.toInt();
      finalAmount = 0.obs;
    }
  }

  increaseQty({required int index}) {
    allCartProducts[index].qty.value++;
  }

  decrease({required int index}) {
    if (allCartProducts[index].qty.value == 0) {
      allCartProducts.removeAt(index);
    } else {
      allCartProducts[index].qty.value--;
    }
  }

  sortingNameAZ() {
    allProducts.sort(
      (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
    );
  }

  sortingNameZA() {
    allProducts.sort(
      (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()),
    );
  }

  sortCategoryAZ() {
    allProducts.sort(
      (a, b) => a.category.toLowerCase().compareTo(b.category.toLowerCase()),
    );
  }

  sortCategoryZA() {
    allProducts.sort(
      (a, b) => b.category.toLowerCase().compareTo(a.category.toLowerCase()),
    );
  }

  sortPriceLH() {
    allProducts.sort((a, b) => a.price.compareTo(b.price));
  }

  sortPriceHL() {
    allProducts.sort((a, b) => b.price.compareTo(a.price));
  }

  sortRating() {
    int c = 0;
    allProducts.sort((a, b) {
      if (double.parse(a.rating.toString()) <
          double.parse(b.rating.toString())) {
        c++;
        log(allProducts[c].rating.toString());
        return 0;
      } else {
        return 1;
      }
    });
  }

  delete({required ProductModal productModal}) {
    allCartProducts.remove(productModal);
  }
}
