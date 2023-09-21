// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipapp/cards/scannerlist/scanned_last_7_days_card.dart';

import '../../cards/terminallist/no_connection_last_7_days_card.dart';
import '../../model/scanner/snanner_scanned_last_7_days.dart';
import '../../model/terminaltab/terminal_no_connection_last_7_days.dart';
import '../../pref/peference_manager.dart';
import '../../utils/Network_info_util.dart';
import 'package:http/http.dart' as http;

class NoConnectionLast7DaysDialog extends StatefulWidget {
  @override
  _NoConnectionLast7DaysDialogState createState() => _NoConnectionLast7DaysDialogState();
}

class _NoConnectionLast7DaysDialogState extends State<NoConnectionLast7DaysDialog> {
  List<NoConnectionLast7Days> salesItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _runBackgroundTask();
  }

  Future<void> _runBackgroundTask() async {
    try {
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

      if (tokenResponse.statusCode != 200) {
        throw Exception('Failed to fetch token.');
      }

      final tokenJson = json.decode(tokenResponse.body);
      final token = tokenJson['authToken'];

      String? userId = await PreferenceManager.getString(PreferenceManager.KEY_USER_ID);
      int? ferryId = await PreferenceManager.getInt(PreferenceManager.KEY_FERRY_ID);

      final body = jsonEncode({
        "userId": userId,
        "ferryId": ferryId,
      });

      final response = await http.post(
        Uri.parse('$baseUrl/auth/sales/noConnLast7Days'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          salesItems = parseSalesItems(response.body);
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to fetch data.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error in background task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "No Connection Last 7 Days",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder(
            future: _runBackgroundTask(),
            builder: (context, snapshot) {
              if (isLoading) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: salesItems.length,
                    itemBuilder: (context, index) {
                      final salesItem = salesItems[index];
                      return NoConnectionLast7DaysCard(
                        terminalName: salesItem.terminalName,
                        terminalType: salesItem.terminalType,
                        ferryName: salesItem.ferryName,
                        terminalStatus: salesItem.terminalStatus,
                        lastConnection: salesItem.lastConnection,
                        daysAgo: salesItem.daysAgo,
                      );
                    },
                  ),
                );
              }
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('Dismiss'),
          ),
        ],
      ),
    );
  }

  List<NoConnectionLast7Days> parseSalesItems(String jsonStr) {
    final parsed = json.decode(jsonStr);
    final salesList = List<Map<String, dynamic>>.from(parsed['count']);

    return salesList.map((item) {
      return NoConnectionLast7Days(
        item['terminalName'] ?? '',
        item['terminalType'] ?? '',
        item['ferryName'] ?? '',
        item['terminalStatus'] ?? '',
        item['lastConnection'] ?? '',
        item['daysAgo'] ?? 0,
      );
    }).toList();
  }
}
