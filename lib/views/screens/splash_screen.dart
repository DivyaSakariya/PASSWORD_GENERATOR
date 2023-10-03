import 'dart:async';

import 'package:e_commerce/utils/image_utils.dart';
import 'package:e_commerce/utils/screens_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogIn = false;

    Timer(
      const Duration(seconds: 3),
      () {
        isLogIn == false
            ? Get.offAllNamed(ScreensUtils.introScreen)
            : Get.offNamed(ScreensUtils.bottomNavScreen);
      },
    );

    ImageUtils imageUtil = ImageUtils();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUtil.imgPath + imageUtil.splashLogo),
          const Text("eCommerce"),
        ],
      ),
    );
  }
}
