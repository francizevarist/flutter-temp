import 'package:flutter/material.dart';
import 'package:vipapp/pages/home_tabs.dart';
import 'package:vipapp/pages/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Login(),
    '/HomeTabs': (context) => HomeTabs(),
    // Add other routes as needed...
  },
));
