import 'package:flex_app/home_page.dart';
import 'package:get/get.dart';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  get cards => null;
}

class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = User(id: '', name: '', email: '').obs;

  void login(String email, String password) {
    // Your login logic here
    isLoading.value = true;
    // Simulating login for now
    Future.delayed(Duration(seconds: 2), () {
      user.value = User(id: '1', name: 'John', email: email);
      isLoading.value = false;
      // Navigate to home page
      Get.offAll(HomePage());
    });
  }

  void register(String name, String email, String password) {
    // Your registration logic here
    isLoading.value = true;
    // Simulating registration for now
    Future.delayed(Duration(seconds: 2), () {
      user.value = User(id: '1', name: name, email: email);
      isLoading.value = false;
      // Navigate to home page
      Get.offAll(HomePage());
    });
  }

  void loadWallet(String amount) {
    // Your wallet loading logic here
    isLoading.value = true;
    // Simulating wallet loading for now
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      // Show success message or handle error
      // For demonstration, let's show a success message
      Get.snackbar('Success', 'Wallet loaded successfully');
    });
  }

  void loadCard(String cardNumber, String amount) {
    // Your card loading logic here
    isLoading.value = true;
    // Simulating card loading for now
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      // Show success message or handle error
      // For demonstration, let's show a success message
      Get.snackbar('Success', 'Card loaded successfully');
    });
  }
}
