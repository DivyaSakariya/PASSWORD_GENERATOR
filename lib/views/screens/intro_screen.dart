import 'package:e_commerce/utils/image_utils.dart';
import 'package:e_commerce/utils/screens_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageUtils imageUtil = ImageUtils();

    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Choose Product",
              image: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(imageUtil.imgPath + imageUtil.intro1),
              ),
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              body:
                  "A Product is the item offered for sale. A Product can be a service or an item. It can be physical or in virtual or cyber form.",
            ),
            PageViewModel(
              title: "Make Payment",
              image: Image.asset(imageUtil.imgPath + imageUtil.intro2),
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              body:
                  "Payment is the transfer of money\n services in exchange product Payments\n typically made terms agreed.",
            ),
            PageViewModel(
              title: "Get Your Order",
              image: Image.asset(imageUtil.imgPath + imageUtil.intro3),
              decoration: PageDecoration(
                bodyTextStyle:
                    TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
              body:
                  "Business or commerce an order is a stated \n intention either spoken to engage in a \n commercial transaction specific products.",
            ),
          ],
          next: const Text("Next"),
          done: TextButton(
            onPressed: () {
              Get.offAllNamed(ScreensUtils.bottomNavScreen);
              // bool isLogin = false;
              // isLogin == false
              //     ? Get.offAllNamed(ScreensUtils.bottomNavScreen)
              //     : Get.offNamed(ScreensUtils.bottomNavScreen);
            },
            child: const Text("Done"),
          ),
          curve: Curves.easeInOut,
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: const Text("Skip"),
          onDone: () {
            Get.offNamed(ScreensUtils.logInScreen);
          },
        ),
      ),
    );
  }
}
