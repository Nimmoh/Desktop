import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void login() {
    // Implement login logic
    Get.offNamed('/home');
  }
}
