// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ScanningPerFerryDaysCard extends StatelessWidget {
  final int transactionCount;
  final String ferryName;

  ScanningPerFerryDaysCard({
    required this.transactionCount,
    required this.ferryName,
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
                "Transaction Count",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$transactionCount'),
            ),
            ListTile(
              title: Text(
                "Ferry Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(ferryName),
            )
          ],
        ),
      ),
    );
  }
}
