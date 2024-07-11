import 'package:get/get.dart';

class SignInController extends GetxController {
  final username = ''.obs;
  RxString email = ''.obs;
  final password = ''.obs;
  final isLoading = true.obs;

  void getInputEmail(String e) {
    email.value = e;
  }

  void setUserName(String name) {
    username.value = name;
    isLoading.value = false;
  }
}
