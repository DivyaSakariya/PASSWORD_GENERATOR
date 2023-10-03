import 'package:e_commerce/controllers/home_controller.dart';
import 'package:e_commerce/views/screens/bottom_navigation_screen.dart';
import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:e_commerce/views/screens/detail_screen.dart';
import 'package:e_commerce/views/screens/home_screen.dart';
import 'package:e_commerce/views/screens/intro_screen.dart';
import 'package:e_commerce/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
          ),
          getPages: [
            GetPage(
              name: '/',
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: '/intro_screen',
              page: () => const IntroScreen(),
            ),
            // GetPage(
            //   name: '/login_screen',
            //   page: () => const LoginScreen(),
            // ),
            GetPage(
              name: '/bottom_navigation_screen',
              page: () => const BottomNavigationScreen(),
            ),
            GetPage(
              name: '/home_screen',
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: '/detail_screen',
              page: () => DetailScreen(),
            ),
            GetPage(
              name: '/cart_screen',
              page: () => CartScreen(),
            ),
          ],
        );
      },
    );
  }
}
