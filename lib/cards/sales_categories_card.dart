// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls, avoid_print
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';
import 'package:vipapp/cards/sales_item_card.dart';
import 'package:vipapp/model/salestab/salescategory.dart';
import 'package:vipapp/model/salestab/salesitem.dart';
import 'package:http/http.dart' as http;
import 'package:vipapp/pref/peference_manager.dart';

import '../utils/Network_info_util.dart';
import '../utils/sales_categories.dart';

class SalesCategoriesCard extends StatefulWidget {

  final SalesCategory mSalesCategory;
  SalesCategoriesCard(this.mSalesCategory);

  @override
  State<SalesCategoriesCard> createState() => _SalesCategoriesCardState(mSalesCategory);
}

class _SalesCategoriesCardState extends State<SalesCategoriesCard> {
  final SalesCategory _mSalesCategory;
  _SalesCategoriesCardState(this._mSalesCategory);

  List<SalesItem> _data = []; // Store the fetched data here

  @override
  void initState() {
    super.initState();
    // Run a background task when the widget is initialized
    _runBackgroundTask(1);
  }

  Future<void> _runBackgroundTask(int key) async {
    try {
      // Perform your background task here

      final baseUrl = NetworkInfoUtil.getBaseUrl();
      final clientId = NetworkInfoUtil.getClientId();
      final authKey = NetworkInfoUtil.getAuthKey();

      // Step 1: Get the token
      final tokenResponse = await http.get(
        Uri.parse('$baseUrl/getAuthToken'),
        headers: {
          'Client-Id': clientId,
          'Auth-Key': authKey,
        },
      );

      if (tokenResponse.statusCode != 200) {
        // Handle token request error
        throw Exception('Failed to fetch token.');
      }

      final tokenJson = json.decode(tokenResponse.body);
      final token = tokenJson['authToken'];



      print('token : ');
      print(token);

      String? userId = await PreferenceManager.getString(PreferenceManager.KEY_USER_ID);
      print(userId);

      int? ferryId = await PreferenceManager.getInt(PreferenceManager.KEY_FERRY_ID);
      print(ferryId);


      //Step 2 : Load data
      if (key == 1) {
        // Execute the first link with a specific JSON body and headers
        final body = jsonEncode({
          "userId": userId,
          "ferryId": ferryId,
        });

        final response = await http.post(
          Uri.parse('$baseUrl/auth/sales/lastSevenDays'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            // Add this line for POST requests
          },
          body: body,
        );


        if (response.statusCode == 200) {

          print('Response JSON: ${response.body}');
          final List<SalesItem> salesItems = _parseSalesItems(response.body);
          setState(() {
            // Parse the response data and update the _data list
            _data = salesItems;
          });

          salesItems.forEach((salesItem) {
            print('Title: ${salesItem.title}');
            print('Value: ${salesItem.value}');
          });

        } else {
          // Handle request error
          print('Failed to fetch data. Status code: ${response.statusCode}');
          throw Exception('Failed to fetch data.');
        }

      }

      // You can use the result if needed
      print('Background task completed');
    } catch (e) {
      // Handle any errors that occur during the background task
      print('Error in background task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget salesItemTemplate(SalesItem salesItem){
      return SalesItemCard(salesItem);
    }

    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Text(
                    _mSalesCategory.categoryName,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 8,),
                  CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.5,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: _data.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Center(
                            child: ListView.builder(
                                itemCount: _data.length,
                                itemBuilder:(BuildContext context, int index) {
                                  return salesItemTemplate(_data[index]);
                                },
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Center(
                    child: Text(
                      "...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800],
                        letterSpacing: 6
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<List<SalesItem>> fetchData(int key) async {
  final baseUrl = NetworkInfoUtil.getBaseUrl();
  final clientId = NetworkInfoUtil.getClientId();
  final authKey = NetworkInfoUtil.getAuthKey();

  // Step 1: Get the token
  final tokenResponse = await http.get(
  Uri.parse('$baseUrl/getAuthToken'),
  headers: {
  'Client-Id': clientId,
  'Auth-Key': authKey,
  },
  );

  if (tokenResponse.statusCode != 200) {
  // Handle token request error
  throw Exception('Failed to fetch token.');
  }

  final tokenJson = json.decode(tokenResponse.body);
  final token = tokenJson['authToken'];

  // Step 2: Send specific request based on key/id
  final response = await _fetchDataByLink(key, baseUrl, token);

  if (response.statusCode == 200) {
  final List<SalesItem> salesItems = _parseSalesItems(response.body);
  return salesItems;
  } else {
  // Handle request error
  throw Exception('Failed to fetch data.');
  }
  }

  Future<http.Response> _fetchDataByLink(int key, String baseUrl, String token) async {
  if (key == 1) {
  // Execute the first link with a specific JSON body and headers
  final body = jsonEncode({
    "userId": PreferenceManager.getString(PreferenceManager.KEY_USER_ID),
    "ferryId": PreferenceManager.getInt(PreferenceManager.KEY_FERRY_ID),
  });

  final response = await http.post(
  Uri.parse('$baseUrl/auth/sales/lastSevenDays'),
  headers: {
  'Authorization': 'Bearer $token',
  'Content-Type': 'application/json', // Add this line for POST requests
  },
  body: body,
  );

  return response;
  } else {
  // Handle other keys or cases here
  throw Exception('Invalid key: $key');
  }
  }

  List<SalesItem> _parseSalesItems(String responseBody) {
    final parsed = json.decode(responseBody);

    // Assuming your JSON structure contains an array of items
    return List<SalesItem>.from(parsed['sales'].map((item) {
      final salesData = <String, String>{};
      item.forEach((key, value) {
        // Convert camelCase key to Title Case
        final title = key.splitMapJoin(RegExp(r'[A-Z]'), onMatch: (m) => ' ${m.group(0)}');
        salesData[title] = value.toString();
      });

      return SalesItem(
        salesData.keys.first, // Get the first key as the title
        salesData.values.first, // Get the value corresponding to the title
      );
    }));
  }


}

