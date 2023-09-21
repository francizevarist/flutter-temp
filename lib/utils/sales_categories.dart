import 'package:vipapp/model/salestab/salescategory.dart';
import 'package:vipapp/model/salestab/salesitem.dart';
import 'package:vipapp/model/salestab/tab_sales_item.dart';
import 'package:vipapp/model/terminaltab/tab_terminal_item.dart';

import '../model/infotab/info_item.dart';
import '../model/salestab/sales_tab_last_7_days.dart';
import '../model/terminaltab/terminal_not_connected.dart';

class SalesCategories {
  static List<SalesCategory> getCategories() {
    return [
      SalesCategory('Last 7 Days',1),
      SalesCategory('Top 5 Most Selling Terminal 7',2),
      SalesCategory('Top 5 Most Selling Product 7 Days',3),
      SalesCategory('Top 10 Most Selling Routes 7 Days',4),
      SalesCategory('Sales Per Ferry 5 Days',5),
      SalesCategory('GEPG Paid Bills Last 10',6)
    ];
  }

  static List<SalesCategory> getTerminalCategories() {
    return [
      SalesCategory('Connection Last 10 minutes',1),
      SalesCategory('Not Connected Last 7 days',2),
    ];
  }

  static List<SalesItem> getItem() {
    return [
      SalesItem('Date','20-01-2023'),
      SalesItem('Sales','3000'),
      SalesItem('Terminal','10'),
      SalesItem('Terminal','10'),
    ];
  }

  static List<SalesItem> getItem1() {
    return [
      SalesItem('Date','20-01-2023'),
    ];
  }




  static List<TerminalNotConnected> getTerminalNotConnected(){
    return [
      TerminalNotConnected("Mag scanner", "Scanner", "Magogoni", "ACTIVE", "2023-09-02 12:50:42.0000000", "7"),
      TerminalNotConnected("Mag scanner", "Scanner", "Magogoni", "ACTIVE", "2023-09-02 12:50:42.0000000", "7")
    ];
  }

  static List<InfoItem> getInfoCards(){
    return [
      InfoItem('Profile',1),
      InfoItem('Zones',2),
      InfoItem('Zone Ferries',3),
      InfoItem('Terminal',4),
      InfoItem('Routes',5),
      InfoItem('Users',6),
      InfoItem('Settings',7),
      InfoItem('Logout',8),
    ];
  }

  static List<TabSalesItem> getTabSaleCards(){
    return [
      TabSalesItem('Last 7 Days',1),
      TabSalesItem('Top 5 Most Selling Terminal 7 Days',2),
      TabSalesItem('Top 5 Most Selling Product 7 Days',3),
      TabSalesItem('Top 10 Most Selling Routes 7 Days',4),
      TabSalesItem('Sales Per Ferry 5 Days',5),
      TabSalesItem('GEPG Paid Bills Last 10',6),
    ];
  }

  static List<TabScannerItem> getTabTerminalCards(){
    return [
      TabScannerItem('Connections Last 10 Minutes',1),
      TabScannerItem('No Connection Last 7 Days',2),
    ];
  }

  static List<TabScannerItem> getTabScannerCards(){
    return [
      TabScannerItem('Scanned Last 7 Days',1),
      TabScannerItem('Scanning Per Ferry 7 Days',2),
    ];
  }

  //data(Last 7 Days)
  static List<SalesItemLast7Days> getSalesItemLast7Days(){
    return [
      SalesItemLast7Days(1000,4000,'2023-09-18'),
      SalesItemLast7Days(2000,6000,'2023-09-19'),
      SalesItemLast7Days(3000,9000,'2023-09-20'),
      SalesItemLast7Days(4000,1000,'2023-09-21'),
      SalesItemLast7Days(5000,3000,'2023-09-22'),
      SalesItemLast7Days(6000,7000,'2023-09-23'),
    ];
  }



}
