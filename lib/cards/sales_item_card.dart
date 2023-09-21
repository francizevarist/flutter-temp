// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vipapp/model/salestab/salesitem.dart';

class SalesItemCard extends StatefulWidget {

  final SalesItem salesItem;
  SalesItemCard(this.salesItem);

  @override
  State<SalesItemCard> createState() => _SalesItemCardState(salesItem);
}

class _SalesItemCardState extends State<SalesItemCard> {

  SalesItem _salesItem;
  _SalesItemCardState(this._salesItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.data_exploration_rounded, // Add your desired icon here
                  color: Colors.teal[400],
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Text(
                    _salesItem.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0), // Adjust radius for rounded badge
                  ),
                  child: Text(
                    _salesItem.value, // Replace with your badge value
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Other widgets in your Column...
          ],
        )
        ,
      ),
    );
  }
}
