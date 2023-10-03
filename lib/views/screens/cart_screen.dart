import 'package:e_commerce/controllers/home_controller.dart';
import 'package:e_commerce/modals/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cart Product",
                    style: GoogleFonts.alice(
                        fontSize: 20,
                        letterSpacing: 1,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              (homeController.allCartProducts.isNotEmpty)
                  ? ListView.builder(
                      itemCount: homeController.allCartProducts.length,
                      itemBuilder: (context, index) {
                        ProductModal productModal =
                            homeController.allCartProducts[index];

                        return Container(
                          height: 110,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 70,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      productModal.thumbnailImg,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 5, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productModal.title,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      productModal.category,
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "₹${productModal.price}",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        homeController.delete(
                                            productModal: productModal);
                                      },
                                      icon: Icon(
                                        Icons.close_rounded,
                                        size: 20,
                                        color: Colors.teal.shade900,
                                      )),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // ic = controller.cartList[index].ic!;
                                          // if (ic > 0) {
                                          //   ic--;
                                          // }
                                          // FirebaseHelper.firehelper
                                          //     .cartUpdate(Model_ecommerce(ic: ic));
                                          // print(ic);
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                      Container(
                                        height: 21,
                                        width: 18,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "saf",
                                          // "${controller.cartList[index].ic}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.teal.shade900,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // ic = controller.cartList[index].ic!;
                                          // ic++;
                                          // FirebaseHelper.firehelper
                                          //     .cartUpdate(Model_ecommerce(ic: ic));
                                          // print(ic);
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_outlined,
                                          color: Colors.teal.shade900,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("Yet Product Noy Added !!"),
                    ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "₹${homeController.amount.value}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.black),
              Row(
                children: const [
                  Text("Order instructions", style: TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Color(0xff07635d)),
                    borderRadius: BorderRadius.circular(25)),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, 'buy');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff07635d)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Buy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
