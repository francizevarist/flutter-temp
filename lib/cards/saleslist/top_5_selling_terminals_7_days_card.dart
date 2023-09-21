// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class Top5sellingTerminals7DaysCard extends StatelessWidget {
  final int transactionSale;
  final int transactionCount;
  final int terminalId;
  final String terminalName;
  final String ferryName;

  Top5sellingTerminals7DaysCard({
    required this.transactionSale,
    required this.transactionCount,
    required this.terminalId,
    required this.terminalName,
    required this.ferryName
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Transaction Sale",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('\$$transactionSale'),
            ),
            ListTile(
              title: Text(
                "Transaction Count",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$transactionCount'),
            ),
            ListTile(
              title: Text(
                "Terminal Id",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$terminalId'),
            ),
            ListTile(
              title: Text(
                "Terminal Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(terminalName),
            ),
            ListTile(
              title: Text(
                "Ferry Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(ferryName),
            ),
          ],
        ),
      ),
    );
  }
}
