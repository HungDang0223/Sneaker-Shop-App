import 'package:get/get.dart';
import 'package:sneaker_shop_app/data/models/user.dart';

class UserController extends GetxController {
  final isLoading = true.obs;
   Rx<User> user =
      User(uid: "", userName: "", email: "", password: "", userPhoto: "").obs;
  void setUser(User _user) {
    user.value.setUser(_user);
  }
}
