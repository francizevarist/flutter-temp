// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Top5sellingProducts7DaysCard extends StatelessWidget{
  final int transactionSale;
  final int transactionCount;
  final String product;

  Top5sellingProducts7DaysCard({
    required this.transactionSale,
    required this.transactionCount,
    required this.product,
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
                "Product",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$product'),
            ),
          ],
        ),
      ),
    );
  }

}