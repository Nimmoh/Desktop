import 'package:get/get.dart';

class LoginController extends GetxController {
  var phone = ''.obs;
  var password = ''.obs;

  void login() {
    // Implement login logic
    Get.offNamed('/home');
  }
}
