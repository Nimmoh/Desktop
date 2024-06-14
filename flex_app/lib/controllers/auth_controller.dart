import 'package:flex_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  final String id;
  final String name;
  final String phone;

  User({required this.id, required this.name, required this.phone});

  get cards => null;
}

class Transaction {
  final String title;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
  });
}

class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = User(id: '', name: '', phone: '').obs;
  var walletBalance = 0.0.obs; // Observable for wallet balance
  var transactions = <Transaction>[].obs; // Observable list of transactions

  void login(String phone, String password) {
    // Your login logic here
    isLoading.value = true;
    // Simulating login for now
    Future.delayed(Duration(seconds: 2), () {
      user.value = User(id: '1', name: 'John Doe', phone: phone);
      isLoading.value = false;
      // Navigate to home page
      Get.offAll(HomePage());
    });
  }

  void register(String name, String phone, String password) {
    // Your registration logic here
    isLoading.value = true;
    // Simulating registration for now
    Future.delayed(Duration(seconds: 2), () {
      user.value = User(id: '1', name: name, phone: phone);
      isLoading.value = false;
      // Navigate to home page
      Get.offAll(HomePage());
    });
  }

  void loadWallet(String amount) {
    // Your wallet loading logic here
    double walletAmount = double.tryParse(amount) ?? 0.0;

    if (walletAmount <= 0) {
      Get.snackbar(
        'Error',
        'Invalid amount',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    // Simulating wallet loading for now
    Future.delayed(Duration(seconds: 2), () {
      walletBalance.value += walletAmount;
      isLoading.value = false;
      // Add transaction to history
      addTransaction(Transaction(
        title: 'Wallet Loaded',
        description: 'You loaded $amount KES to your wallet.',
        amount: walletAmount,
        date: DateTime.now(),
      ));
      // Show success message
      Get.snackbar(
        'Success',
        'Wallet loaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void loadCard(String cardNumber, String amount) {
    // Your card loading logic here
    isLoading.value = true;
    // Simulating card loading for now
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      // Add transaction to history
      addTransaction(Transaction(
        title: 'Card Loaded',
        description: 'You loaded $amount KES from card $cardNumber.',
        amount: double.tryParse(amount) ?? 0.0,
        date: DateTime.now(),
      ));
      // Show success message
      Get.snackbar('Success', 'Card loaded successfully');
    });
  }

  void transferMoney(String recipient, String amount) {
    // Implement transfer logic here
    double transferAmount = double.tryParse(amount) ?? 0.0;
    double currentBalance = walletBalance.value;

    if (transferAmount > 0 && transferAmount <= currentBalance) {
      // Example logic to update wallet balance
      walletBalance.value -= transferAmount;

      // Add transaction to history
      addTransaction(Transaction(
        title: 'Transfer to $recipient',
        description: 'You transferred $amount KES to $recipient.',
        amount: transferAmount,
        date: DateTime.now(),
      ));

      // Example: Show a success message
      Get.snackbar(
        'Transfer Successful',
        'You transferred $amount to $recipient',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Example: Show an error message
      Get.snackbar(
        'Transfer Failed',
        'Invalid amount or insufficient balance',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  List<Transaction> getTransactions() {
    return transactions.toList();
  }
}
