// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String idNumber;
  final String mobile;
  final String ferryName;
  final String idName;
  final String role_name;
  final String usr_status;
  final String userId;

  UserInfoCard({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.idNumber,
    required this.mobile,
    required this.ferryName,
    required this.idName,
    required this.role_name,
    required this.usr_status,
    required this.userId
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
                "First Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(firstName),
            ),
            ListTile(
              title: Text(
                "Last Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(lastName),
            ),
            ListTile(
              title: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(email),
            ),
            ListTile(
              title: Text(
                "IdNumber",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(''),
            ),
            ListTile(
              title: Text(
                "Mobile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(mobile),
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
                "ID Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(idName),
            ),
            ListTile(
              title: Text(
                "Role Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(role_name),
            ),
            ListTile(
              title: Text(
                "User Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(usr_status),
            )
          ],
        ),
      ),
    );
  }
}
