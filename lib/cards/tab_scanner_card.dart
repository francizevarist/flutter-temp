// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:vipapp/dialogs/sales/dialog_top_5_selling_terminals_7_days.dart';
import 'package:vipapp/dialogs/scanner/dialog_scanned_last_7_days.dart';
import 'package:vipapp/dialogs/scanner/dialog_scanning_per_ferry_7_days.dart';
import 'package:vipapp/model/salestab/tab_sales_item.dart';
import 'package:vipapp/utils/sales_categories.dart';

import '../dialogs/sales/dialog_last_7_days.dart';
import '../model/salestab/sales_tab_last_7_days.dart';
import '../model/terminaltab/tab_terminal_item.dart';

class TabScannerCard extends StatefulWidget {
  TabScannerItem tabScannerItem;
  TabScannerCard(this.tabScannerItem);

  @override
  State<TabScannerCard> createState() => _TabScannerCardState(tabScannerItem);
}

class _TabScannerCardState extends State<TabScannerCard> {
  TabScannerItem _tabSalesItem;
  _TabScannerCardState(this._tabSalesItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(_tabSalesItem.typeId) {
          case 1:
            showScannedLast7DaysDialog(context);
            break;
          case 2:
            showScanningPerFerry7DaysDialog(context);
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
                  _getIconForType(widget.tabScannerItem.typeId),
                  color: _getIconColorForType(widget.tabScannerItem.typeId),
                ),
                SizedBox(width: 8,), // Add horizontal spacing
                Text(
                  widget.tabScannerItem.itemType,
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
        return Icons.qr_code;
      case 2:
        return Icons.qr_code;
      default:
        return Icons.qr_code;
    }
  }

  Color _getIconColorForType(int typeId) {
    switch (typeId) {
      case 1:
        return Colors.black; // Change the color as needed
      case 2:
        return Colors.black; // Change the color as needed
      default:
        return Colors.black; // Change the color as needed
    }
  }


  // Show the dialog when needed
  void showScannedLast7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScannedLast7DaysDialog();
      },
    );
  }

  // Show the dialog when needed
  void showScanningPerFerry7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScanningPerFerry7DaysDialog();
      },
    );
  }

}

