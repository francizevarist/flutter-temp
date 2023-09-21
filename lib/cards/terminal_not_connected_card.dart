// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vipapp/cards/sales_item_card.dart';

import '../model/salestab/salesitem.dart';
import '../model/terminaltab/terminal_not_connected.dart';
import '../model/terminaltab/terminalcategory.dart';
import '../utils/sales_categories.dart';

class TerminalNotConnectedCard extends StatefulWidget {
  TerminalCategory terminalCategory;
  TerminalNotConnectedCard(this.terminalCategory);

  @override
  State<TerminalNotConnectedCard> createState() => _TerminalNotConnectedCardState(terminalCategory);
}

class _TerminalNotConnectedCardState extends State<TerminalNotConnectedCard> {
  final TerminalCategory _mTerminalCategory;
  _TerminalNotConnectedCardState(this._mTerminalCategory);
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
                    _mTerminalCategory.categoryName,
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
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Center(
                            child: ListView.builder(
                              itemCount: SalesCategories.getItem().length,
                              itemBuilder:(BuildContext context, int index) {
                                return salesItemTemplate(SalesCategories.getItem()[index]);
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
}
