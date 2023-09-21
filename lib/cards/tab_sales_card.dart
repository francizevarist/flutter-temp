// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vipapp/dialogs/sales/dialog_top_10_selling_routes_7_days.dart';
import 'package:vipapp/dialogs/sales/dialog_top_5_selling_terminals_7_days.dart';
import 'package:vipapp/model/salestab/tab_sales_item.dart';
import 'package:vipapp/utils/sales_categories.dart';

import '../dialogs/sales/dialog_gepg_latest_10_paid_bills.dart';
import '../dialogs/sales/dialog_last_7_days.dart';
import '../dialogs/sales/dialog_sales_per_ferry_5_days.dart';
import '../dialogs/sales/dialog_top_5_selling_products_7_days.dart';
import '../model/salestab/sales_tab_last_7_days.dart';

class TabSaleCard extends StatefulWidget {
  TabSalesItem tabSalesItem;
  TabSaleCard(this.tabSalesItem);

  @override
  State<TabSaleCard> createState() => _TabSaleCardState(tabSalesItem);
}

class _TabSaleCardState extends State<TabSaleCard> {
  TabSalesItem _tabSalesItem;
  _TabSaleCardState(this._tabSalesItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(_tabSalesItem.typeId) {
          case 1:
            showSalesLast7DaysDialog(context);
            break;
          case 2:
            showTop5sellingTerminals7DaysDialog(context);
            break;
          case 3:
            showTop5sellingProducts7DaysDialog(context);
            break;
          case 4:
            showTop10sellingRoutes7DaysDialog(context);
            break;
          case 5:
            showSalesPerFerry5DaysDialog(context);
            break;
          case 6:
            showGepgLatest10PaidBillsDialog(context);
            break;

      }
      },
      child: Container(
        height: 55.0,
        child: Card(
          color: Colors.grey[100],
          margin: EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Center both icon and text vertically within the row
              crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally with respect to icon
              children: [
                Icon(
                  _getIconForType(widget.tabSalesItem.typeId),
                  color: _getIconColorForType(widget.tabSalesItem.typeId),
                ),
                SizedBox(width: 8,), // Add horizontal spacing
                Text(
                  widget.tabSalesItem.itemType,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(int typeId) {
    switch (typeId) {
      case 1:
        return Icons.featured_play_list_outlined;
      case 2:
        return Icons.featured_play_list_outlined;
      case 3:
        return Icons.featured_play_list_outlined;
      case 4:
        return Icons.featured_play_list_outlined;
      case 5:
        return Icons.featured_play_list_outlined;
      case 6:
        return Icons.featured_play_list_outlined;
      case 7:
        return Icons.featured_play_list_outlined;
      default:
        return Icons.featured_play_list_outlined;
    }
  }

  Color _getIconColorForType(int typeId) {
    switch (typeId) {
      case 1:
        return Colors.black; // Change the color as needed
      case 2:
        return Colors.black; // Change the color as needed
      case 3:
        return Colors.black; // Change the color as needed
      case 4:
        return Colors.black; // Change the color as needed
      case 5:
        return Colors.black; // Change the color as needed
      case 6:
        return Colors.black; // Change the color as needed
      case 7:
        return Colors.black; // Change the color as needed
      default:
        return Colors.black; // Change the color as needed
    }
  }



  // Obtain your list of SalesItemLast7Days data
  List<SalesItemLast7Days> salesData = SalesCategories.getSalesItemLast7Days();

  // Show the dialog when needed
  void showSalesLast7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SalesLast7DaysDialog();
      },
    );
  }

  // Show the dialog when needed
  void showTop5sellingTerminals7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Top5SellingTerminals7DaysDialog();
      },
    );
  }

  // Show the dialog when needed
  void showTop5sellingProducts7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Top5SellingProducts7DaysDialog();
      },
    );
  }

  // Show the dialog when needed
  void showTop10sellingRoutes7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Top10SellingRoutes7DaysDialog();
      },
    );
  }

  // Show the dialog when needed
  void showSalesPerFerry5DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SalesPerFerry5DaysCardDialog();
      },
    );
  }

  // Show the dialog when needed
  void showGepgLatest10PaidBillsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GepgLatest10PaidBillsDialog();
      },
    );
  }

}

