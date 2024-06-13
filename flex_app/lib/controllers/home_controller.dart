import 'package:get/get.dart';
import '../services/api_services.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  var cardDetails = <Map<String, String>>[].obs;
  var amount = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCardDetails();
  }

  void fetchCardDetails() async {
    cardDetails.value = await _apiService.fetchCardDetails();
  }

  void loadWallet() async {
    if (amount.value.isEmpty) {
      Get.snackbar('Error', 'Please enter an amount');
      return;
    }
    try {
      await _apiService.loadWallet(amount.value);
      Get.snackbar('Success', 'Wallet loaded with \$${amount.value}');
    } catch (e) {
      Get.snackbar('Error', 'Failed to load wallet: $e');
    }
  }

  void loadCard(String cardNumber) async {
    if (amount.value.isEmpty) {
      Get.snackbar('Error', 'Please enter an amount');
      return;
    }
    try {
      await _apiService.loadCard(cardNumber, amount.value);
      Get.snackbar('Success', 'Loaded \$${amount.value} into card $cardNumber');
    } catch (e) {
      Get.snackbar('Error', 'Failed to load card: $e');
    }
  }
}
