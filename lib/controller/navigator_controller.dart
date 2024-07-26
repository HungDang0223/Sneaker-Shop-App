import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class NavigatorController extends GetxController {
  RxInt selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}