// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TerminalInfoCard extends StatelessWidget {
  final int id;
  final int terminalId;
  final String terminalName;
  final String terminalType;
  final String ferryName;
  final String imeiNumber;
  final String terminalStatus;

  TerminalInfoCard({
    required this.id,
    required this.terminalId,
    required this.terminalName,
    required this.terminalType,
    required this.ferryName,
    required this.imeiNumber,
    required this.terminalStatus
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
                "Terminal Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(terminalType),
            ),
            ListTile(
              title: Text(
                "Ferry Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(ferryName),
            ),
            ListTile(
              title: Text(
                "IMEI",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(imeiNumber),
            ),
            ListTile(
              title: Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(terminalStatus),
            )
          ],
        ),
      ),
    );
  }
}
