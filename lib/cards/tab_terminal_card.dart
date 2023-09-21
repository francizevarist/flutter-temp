// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vipapp/utils/sales_categories.dart';

import '../dialogs/sales/dialog_last_7_days.dart';
import '../dialogs/terminal/dialog_no_connection_last_7_days.dart';
import '../model/salestab/sales_tab_last_7_days.dart';
import '../model/terminaltab/tab_terminal_item.dart';

class TabTerminalCard extends StatefulWidget {
  TabScannerItem tabTerminalItem;
  TabTerminalCard(this.tabTerminalItem);

  @override
  State<TabTerminalCard> createState() => _TabTeminalCardState(tabTerminalItem);
}

class _TabTeminalCardState extends State<TabTerminalCard> {
  TabScannerItem _tabSalesItem;
  _TabTeminalCardState(this._tabSalesItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(_tabSalesItem.typeId) {
          case 1:
            //showSalesLast7DaysDialog(context);
            break;
          case 2:
            showNoConnectionLast7DaysDialog(context);
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
                  _getIconForType(widget.tabTerminalItem.typeId),
                  color: _getIconColorForType(widget.tabTerminalItem.typeId),
                ),
                SizedBox(width: 8,), // Add horizontal spacing
                Text(
                  widget.tabTerminalItem.itemType,
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
        return Icons.cloud_done_outlined;
      case 2:
        return Icons.cloud_off;
      default:
        return Icons.cloud_done_outlined;
    }
  }

  Color _getIconColorForType(int typeId) {
    switch (typeId) {
      case 1:
        return Colors.teal; // Change the color as needed
      case 2:
        return Colors.redAccent; // Change the color as needed
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
  void showNoConnectionLast7DaysDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NoConnectionLast7DaysDialog();
      },
    );
  }

}

