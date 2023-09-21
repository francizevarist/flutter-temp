// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vipapp/model/infotab/terminal_info.dart';

import '../../cards/infolist/route_info_card.dart';
import '../../cards/infolist/terminal_info_card.dart';
import '../../model/infotab/route_info.dart';
import '../../pref/peference_manager.dart';
import '../../utils/Network_info_util.dart';
import 'package:http/http.dart' as http;

class RouteInfoDialog extends StatefulWidget {
  @override
  _RouteInfoDialogState createState() => _RouteInfoDialogState();
}

class _RouteInfoDialogState extends State<RouteInfoDialog> {
  List<RouteInfo> salesItems = [];
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
        Uri.parse('$baseUrl/auth/routes'),
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
            "Routes",
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
                      return RouteInfoCard(
                        routeName: salesItem.routeName,
                        ferryName: salesItem.ferryName,
                        routeStatus: salesItem.routeStatus,
                        routeId: salesItem.routeId
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

  List<RouteInfo> parseSalesItems(String jsonStr) {
    final parsed = json.decode(jsonStr);
    final salesList = List<Map<String, dynamic>>.from(parsed['routes']);

    return salesList.map((item) {
      return RouteInfo(
        item['routeName'] ?? '',
        item['ferryName'] ?? '',
        item['routeStatus'] ?? '',
        item['routeId'] ?? 0,
      );
    }).toList();
  }
}

