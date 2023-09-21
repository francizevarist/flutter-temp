// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RouteInfoCard extends StatelessWidget {
  final String routeName;
  final String ferryName;
  final String routeStatus;
  final int routeId;

  RouteInfoCard({
    required this.routeName,
    required this.ferryName,
    required this.routeStatus,
    required this.routeId,
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
                "Route Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(routeName),
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
                "Route Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(routeStatus),
            )
          ],
        ),
      ),
    );
  }
}
