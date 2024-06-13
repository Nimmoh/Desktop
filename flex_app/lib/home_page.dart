import 'package:flex_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController()); // Change to Get.find() instead of Get.put()

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();

    void loadWallet() {
      _authController.loadWallet(amountController.text);
      amountController.clear();
    }

    void loadCard(String cardNumber) {
      _authController.loadCard(cardNumber, amountController.text);
      amountController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Money Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (_authController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  width: double.infinity,
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello, ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            _authController.user.value.name,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }
            }),
            const SizedBox(height: 16),
            const Text(
              'Card Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Implement card details with GetX
            SizedBox(
              width: 270,
              height: 127,
              child: Stack(
                children: [
                  Positioned(
                    left: 195,
                    top: 0,
                    child: Container(
                      width: 72.40,
                      height: 24,
                      child:Image.asset('assets/images/flex_logo.png'),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 4,
                    child: Container(
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 5.94),
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 18,
                    child: Container(
                      padding: const EdgeInsets.only(top: 6, right: 10, bottom: 13),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'KES',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 80,
                            height: 8.18,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Add your wallet balance here
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 33,
                    top: 63,
                    child: Container(
                      width: 15,
                      height: 15,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Image.asset('assets/images/eye.png'),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 102,
                    child: Container(
                      width: 80,
                      height: 25,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 80,
                              height: 25,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE20814),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 6,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Load wallet',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 231,
                    top: 90,
                    child: Container(
                      width: 36,
                      height: 36,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
