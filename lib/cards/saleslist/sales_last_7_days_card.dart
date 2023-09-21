// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SalesLast7DaysCard extends StatelessWidget {
  final String transactionSale;
  final String transactionCount;
  final String transactionDate;

  SalesLast7DaysCard({
    required this.transactionSale,
    required this.transactionCount,
    required this.transactionDate,
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
              trailing: Text(transactionSale),
            ),
            ListTile(
              title: Text(
                "Transaction Count",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(transactionCount),
            ),
            ListTile(
              title: Text(
                "Transaction Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(transactionDate),
            ),
          ],
        ),
      ),
    );
  }
}
