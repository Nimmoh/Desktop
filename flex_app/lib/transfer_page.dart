import 'package:flex_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TransferPage extends StatelessWidget {
  final AuthController _authController = Get.find();

  TextEditingController recipientController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  TransferPage({super.key});

  void transferMoney() {
    String recipient = recipientController.text;
    String amount = amountController.text;
    _authController.transferMoney(recipient, amount);
    recipientController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to previous page (usually HomePage)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: recipientController,
              decoration: const InputDecoration(
                labelText: 'Recipient',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: transferMoney,
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
