import 'package:e_commerce/controllers/bottom_navigation_controller.dart';
import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:e_commerce/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.index.value,
            children: [
              const HomeScreen(),
              CartScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => SizedBox(
            height: 60,
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (value) {
                controller.index.value = value;
              },
              unselectedFontSize: 20,
              mouseCursor: MouseCursor.uncontrolled,
              elevation: 15,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigo,
              items: const [
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.home),
                ),
                // BottomNavigationBarItem(
                //   label: "",
                //   icon: Icon(Icons.search),
                // ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.shopping_cart),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
