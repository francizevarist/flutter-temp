// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vipapp/cards/tab_sales_card.dart';
import 'package:vipapp/cards/tab_scanner_card.dart';
import 'package:vipapp/model/salestab/salescategory.dart';
import 'package:vipapp/model/terminaltab/terminalcategory.dart';

import '../cards/info_card.dart';
import '../cards/sales_categories_card.dart';
import '../cards/tab_terminal_card.dart';
import '../cards/terminal_not_connected_card.dart';
import '../utils/sales_categories.dart';

class HomeTabs extends StatefulWidget {
  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {

  Widget salesCategoryTemplate(SalesCategory salesCategory){
    return SalesCategoriesCard(salesCategory);
  }


  Widget terminalNotConnectedTemplate(TerminalCategory terminalCategory){
    return TerminalNotConnectedCard(terminalCategory);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.blueGrey[200],
            tabs: [
              _buildTab('Sales', Icons.attach_money),
              _buildTab('Terminal', Icons.directions_boat),
              _buildTab('Scanner', Icons.qr_code),
              _buildTab('Info', Icons.info_outline),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: SalesCategories.getTabSaleCards().length,
                itemBuilder: (BuildContext context, int index) {
                  return TabSaleCard(SalesCategories.getTabSaleCards()[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: SalesCategories.getTabTerminalCards().length,
                itemBuilder: (BuildContext context, int index) {
                  return TabTerminalCard(SalesCategories.getTabTerminalCards()[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: SalesCategories.getTabTerminalCards().length,
                itemBuilder: (BuildContext context, int index) {
                  return TabScannerCard(SalesCategories.getTabScannerCards()[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              color: Colors.white,
              child: ListView.builder(
                itemCount: SalesCategories.getInfoCards().length,
                itemBuilder: (BuildContext context, int index) {
                  return InfoCard(SalesCategories.getInfoCards()[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, IconData iconData) {
    return Tab(
      child: Column(
        children: [
          Icon(iconData),
          Text(title,
          style: TextStyle(
            fontSize: 10
          )),
        ],
      ),
    );
  }
}
