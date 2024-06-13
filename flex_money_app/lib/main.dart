import 'package:flex_money_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlexMoneyTransferApp());
}

class FlexMoneyTransferApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Money Transfer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class StatelessWidget {
}
