// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NoConnectionLast7DaysCard extends StatelessWidget {
  final String terminalName;
  final String terminalType;
  final String ferryName;
  final String terminalStatus;
  final String lastConnection;
  final int daysAgo;

  NoConnectionLast7DaysCard({
    required this.terminalName,
    required this.terminalType,
    required this.ferryName,
    required this.terminalStatus,
    required this.lastConnection,
    required this.daysAgo,
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
                "Terminal Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(terminalStatus),
            ),
            ListTile(
              title: Text(
                "Last Connection",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('lastConnection'),
            ),
            ListTile(
              title: Text(
                "Days Ago",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$daysAgo'),
            )
          ],
        ),
      ),
    );
  }
}
