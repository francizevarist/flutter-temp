// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, prefer_const_declarations, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vipapp/pages/home_tabs.dart';
import 'package:vipapp/pref/peference_manager.dart';

import '../utils/Network_info_util.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false; // Track loading state

  Future<void> _handleLogin() async {
    // Set your API base URLs and headers here
    final baseUrl = NetworkInfoUtil.getBaseUrl();
    final clientId = NetworkInfoUtil.getClientId();
    final authKey = NetworkInfoUtil.getAuthKey();

    setState(() {
      _isLoading = true;
    });

    // Step 1: Get the token
    final tokenResponse = await http.get(
      Uri.parse('$baseUrl/getAuthToken'),
      headers: {
        'Client-Id': clientId,
        'Auth-Key': authKey,
      },
    );

    if (tokenResponse.statusCode == 200) {
      final jsonResponse = json.decode(tokenResponse.body);

      // Extract the "authToken" from the JSON response
      final token = jsonResponse['authToken'];

      // Step 2: Send login request
      final loginResponse = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'userName': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (loginResponse.statusCode == 200) {

        // Parse the JSON string
        Map<String, dynamic> jsonData = json.decode(loginResponse.body);

        // Extract values
        String userId = jsonData['userId'];
        int ferryId = jsonData['ferryId'];
        String name = jsonData['name'];
        String mobileNumber = jsonData['mobileNumber'];
        String userName = jsonData['userName'];

        print('save data');
        print(userId);
        print(ferryId);
        PreferenceManager.saveString(PreferenceManager.KEY_USER_ID, userId);
        PreferenceManager.saveInteger(PreferenceManager.KEY_FERRY_ID, ferryId);
        PreferenceManager.saveString(PreferenceManager.KEY_USER_FULL_NAME, name);
        PreferenceManager.saveString(PreferenceManager.KEY_USER_MOBILE_NUMBER, mobileNumber);
        PreferenceManager.saveString(PreferenceManager.KEY_USERNAME, userName);

        // Login successful, navigate to the home page

        /*Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new HomeTabs(),
          ),
        );*/

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeTabs(),
          ),
        );

      } else {

        final jsonMap = json.decode(loginResponse.body);
        final status = jsonMap['status'];
        final error = jsonMap['error'];
        final messages = jsonMap['messages'];

        final errorMessage = messages['error'];

        if(error == '543'){

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ActivateUserDialog(
                initialUsername: _usernameController.text,
              );
            },
          );

        }else {
          // Login failed, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Login failed. Please check your credentials.'),
            ),
          );
        }
      }

    } else {
      // Token request failed, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch token. Please try again later.'),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png', width: 100, height: 100), // Replace with your app logo
          SizedBox(height: 20),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person), // Left icon for username
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock), // Left icon for password
              border: OutlineInputBorder(),
            ),
            obscureText: true, // To hide password
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator() // Show progress indicator while loading
              : Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                 // onPressed: _handleLogin,
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black87), // Set button color to black
                  ),
                  onPressed: _handleLogin,
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ActivateUserDialog extends StatefulWidget {
  final String initialUsername;

  ActivateUserDialog({required this.initialUsername});

  @override
  _ActivateUserDialogState createState() => _ActivateUserDialogState();
}

class _ActivateUserDialogState extends State<ActivateUserDialog> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  void _showErrorSnackBar(BuildContext context, String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Activate User'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Username: ${widget.initialUsername}'),
          TextFormField(
            controller: _currentPasswordController,
            decoration: InputDecoration(labelText: 'Current Password'),
            obscureText: true,
          ),
          TextFormField(
            controller: _newPasswordController,
            decoration: InputDecoration(labelText: 'New Password'),
            obscureText: true,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Perform the activation logic here
            final currentPassword = _currentPasswordController.text;
            final newPassword = _newPasswordController.text;

            // Close the dialog
            Navigator.of(context).pop();

            // Add your activation logic here, e.g., make an API request
            _activateUser(currentPassword, newPassword);


          },
          child: Text('Activate'),
        ),
      ],
    );
  }

  void _activateUser(String currentPassword, String newPassword) async {
    try {
      // Set your API base URL and headers here
      final baseUrl = NetworkInfoUtil.getBaseUrl();
      final clientId = NetworkInfoUtil.getClientId();
      final authKey = NetworkInfoUtil.getAuthKey();

      final tokenResponse = await http.get(
        Uri.parse('$baseUrl/getAuthToken'),
        headers: {
          'Client-Id': clientId,
          'Auth-Key': authKey,
        },
      );

      print(tokenResponse.body);

      if (tokenResponse.statusCode == 200) {
        final jsonResponse = json.decode(tokenResponse.body);
        final token = jsonResponse['authToken'];


        final response = await http.post(
          Uri.parse('$baseUrl/auth/activateAccount'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'userName': widget.initialUsername,
            'currentPassword': currentPassword,
            'newPassword': newPassword,
          }),
        );

        if (response.statusCode == 200) {
          // Account activation successful
          // You can handle the success case here, e.g., show a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Account activated successfully.'),
            ),
          );
        }else if(response.statusCode == 400) {

          Fluttertoast.showToast(
            msg: "Account activation failed. Please try again.",
            toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
            gravity: ToastGravity.BOTTOM, // The position of the toast message
            timeInSecForIosWeb: 1, // The duration for which the message will be displayed
            backgroundColor: Colors.redAccent, // Background color of the toast
            textColor: Colors.white, // Text color of the toast
            fontSize: 16.0, // Font size of the message
          );

        }
        else {
          // Account activation failed
          // You can handle the failure case here, e.g., show an error message
        }


      } else {
        // Token request failed, show an error message
      }


    } catch (e) {
      // Handle any exceptions that may occur during the network request
    } finally {
      // Close the dialog
    }
  }

}

