import 'package:e_commerce/utils/screens_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_controller.dart';
import '../../modals/product_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce"),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.sort),
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            homeController.sortingNameAZ();
                          });
                        },
                        child: const Icon(Icons.sort_by_alpha_rounded),
                      ),
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            homeController.sortingNameZA();
                          });
                        },
                        child: const Text("Z-A"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: () => homeController.sortRating(),
                        icon: const Icon(Icons.star),
                        label: const Text("Rating"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            homeController.sortPriceLH();
                          });
                        },
                        child: const Text("Low Price"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            homeController.sortPriceHL();
                          });
                        },
                        child: const Text("High Price"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          homeController.sortCategoryAZ();
                        },
                        child: const Text("Category A-Z"),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          homeController.sortCategoryZA();
                        },
                        child: const Text("Category Z-A"),
                      ),
                    ),
                  ]),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: homeController.getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 36.h),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    ProductModal productModal = snapshot.data![index];

                    return InkWell(
                      onTap: () {
                        Get.toNamed(ScreensUtils.detailScreen,
                            arguments: productModal);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 24.h,
                              width: 43.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.indigo.shade100,
                                            child: const Icon(
                                              Icons.favorite,
                                              // color: controller.favoritelist
                                              //         .contains(controller
                                              //             .ProductList[index].id
                                              //             .toString())
                                              //     ? Colors.red
                                              //     : Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ]),
                                  Center(
                                    child: SizedBox(
                                      height: 150,
                                      width: 200,
                                      child: Image.network(
                                        productModal.thumbnailImg,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  productModal.title,
                                  style: const TextStyle(fontSize: 15),
                                  overflow: TextOverflow.fade,
                                ),
                                const Spacer(),
                                Text(
                                  "₹${productModal.price}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  productModal.category,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "${productModal.discountPercentage}%",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR: ${snapshot.error}"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                );
              }
            },
          )),
    );
  }
}
