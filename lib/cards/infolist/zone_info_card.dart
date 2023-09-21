// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ZoneInfoCard extends StatelessWidget {
  final int id;
  final String name;
  final int ferry;

  ZoneInfoCard({
    required this.id,
    required this.name,
    required this.ferry,
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
                "Zone Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(name),
            ),
            ListTile(
              title: Text(
                "Ferry",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('$ferry'),
            )
          ],
        ),
      ),
    );
  }
}
