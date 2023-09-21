// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class GepgLatest10PaidBillsCard extends StatelessWidget {
  final int transactionSale;
  final String controlNumber;
  final String payerName;
  final String transactionDate;

  GepgLatest10PaidBillsCard({
    required this.transactionSale,
    required this.controlNumber,
    required this.payerName,
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
              trailing: Text('\$$transactionSale'),
            ),
            ListTile(
              title: Text(
                "Control Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(controlNumber),
            ),
            ListTile(
              title: Text(
                "Payer Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(payerName),
            ),
            ListTile(
              title: Text(
                "Transaction Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(transactionDate),
            )
          ],
        ),
      ),
    );
  }
}
