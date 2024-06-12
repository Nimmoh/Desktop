import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex_money_app/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  late Future<List<Map<String, String>>> _cardDetailsFuture;
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cardDetailsFuture = _apiService.fetchCardDetails();
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _loadWallet() async {
    final amount = _amountController.text;
    if (amount.isEmpty) {
      _showDialog('Error', 'Please enter an amount');
      return;
    }
    try {
      await _apiService.loadWallet(amount);
      _showDialog('Wallet Loaded', 'You have successfully loaded \$${amount} into your wallet.');
    } catch (e) {
      _showDialog('Error', 'Failed to load wallet: $e');
    }
    _amountController.clear();
  }

  Future<void> _loadCard(String cardNumber) async {
    final amount = _amountController.text;
    if (amount.isEmpty) {
      _showDialog('Error', 'Please enter an amount');
      return;
    }
    try {
      await _apiService.loadCard(cardNumber, amount);
      _showDialog('Card Loaded', 'You have successfully loaded \$${amount} into card $cardNumber.');
    } catch (e) {
      _showDialog('Error', 'Failed to load card: $e');
    }
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Money Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 121,
              height: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'John',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Card Details',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Map<String, String>>>(
              future: _cardDetailsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error fetching card details'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No cards available'));
                }

                final cardDetails = snapshot.data!;
                return CarouselSlider.builder(
                  itemCount: cardDetails.length,
                  itemBuilder: (context, index, realIndex) {
                    final card = cardDetails[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Card Number: ${card['cardNumber']}'),
                            Text('Card Holder: ${card['cardHolder']}'),
                            Text('Expiry Date: ${card['expiryDate']}'),
                            Text('Balance: \$${card['balance']}'),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => _loadCard(card['cardNumber']!),
                              child: Text('Load Card'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              'Load Wallet',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadWallet,
              child: Text('Load Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}
