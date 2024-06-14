import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'transfer_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.offAll(() => HomePage());
        break;
      case 1:
        Get.offAll(() => TransferPage());
        break;
      case 2:
        // Add navigation to Profile page or another page here
        break;
    }
  }

  void _scanQRCode() {
    // Implement QR code scanning functionality here
    Get.snackbar(
      'QR Code',
      'Scan QR Code tapped',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.transfer_within_a_station, 'Transfer', 1),
          GestureDetector(
            onTap: _scanQRCode,
            child: Container(
              width: 64,
              height: 64,
              decoration: ShapeDecoration(
                color: Color(0xFFE20814),
                shape: OvalBorder(),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          _buildNavItem(Icons.account_circle, 'Profile', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.blue : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
