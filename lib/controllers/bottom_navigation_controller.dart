import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;

  changeIndex({required int index}) {
    this.index(index);
    update();
  }
}
