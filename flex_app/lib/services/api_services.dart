class ApiService {
  Future<List<Map<String, String>>> fetchCardDetails() async {
    // Mock API response
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      {'cardNumber': '**** **** **** 1234', 'expiryDate': '12/23', 'cardHolder': 'John Doe', 'balance': '500'},
      {'cardNumber': '**** **** **** 5678', 'expiryDate': '11/24', 'cardHolder': 'Jane Smith', 'balance': '750'},
    ];
  }

  Future<void> loadWallet(String amount) async {
    // Mock API call to load wallet
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    print('Wallet loaded with amount: $amount');
  }

  Future<void> loadCard(String cardNumber, String amount) async {
    // Mock API call to load card
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    print('Card $cardNumber loaded with amount: $amount');
  }
}
