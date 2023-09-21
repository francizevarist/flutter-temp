import 'package:flutter/material.dart';
import 'package:vipapp/dialogs/info/route_info_dialog.dart';
import 'package:vipapp/dialogs/info/terminal_info_dialog.dart';
import 'package:vipapp/dialogs/info/user_info_dialog.dart';
import 'package:vipapp/dialogs/info/zone_info_dialog.dart';
import '../model/infotab/info_item.dart';

class InfoCard extends StatefulWidget {
  InfoItem infoItem;
  InfoCard(this.infoItem);

  @override
  State<InfoCard> createState() => _InfoCardState(infoItem);
}

class _InfoCardState extends State<InfoCard> {
  InfoItem _infoItem;
  _InfoCardState(this._infoItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch(_infoItem.typeId){
          case 1:
            //profile
            break;
          case 2:
            //zone
            showZoneDialog(context);
            break;
          case 3:
            //zone ferries
            showZoneDialog(context);
            break;
          case 4:
            //Terminal
            showTerminalDialog(context);
            break;
          case 5:
            //routes
            showRoutesDialog(context);
            break;
          case 6:
            //users
            showUserDialog(context);
            break;
          case 7:
            //settings
            break;
          case 8:
            //logout
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _getIconForType(widget.infoItem.typeId),
                  color: _getIconColorForType(widget.infoItem.typeId),
                ),
                SizedBox(width: 8,),
                Text(
                  widget.infoItem.infoType,
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
        return Icons.person;
      case 2:
        return Icons.location_on;
      case 3:
        return Icons.directions_boat;
      case 4:
        return Icons.business;
      case 5:
        return Icons.route;
      case 6:
        return Icons.people;
      case 7:
        return Icons.settings;
      case 8:
        return Icons.power_settings_new;
      default:
        return Icons.error;
    }
  }

  Color _getIconColorForType(int typeId) {
    switch (typeId) {
      case 1:
        return Colors.blue; // Change the color as needed
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
      case 8:
        return Colors.redAccent; // Change the color as needed
      default:
        return Colors.black; // Change the color as needed
    }
  }

  // Show the dialog when needed
  void showZoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ZoneInfoDialog();
      },
    );
  }

  void showZoneFerriesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ZoneInfoDialog();
      },
    );
  }

  void showTerminalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TerminalInfoDialog();
      },
    );
  }

  void showRoutesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RouteInfoDialog();
      },
    );
  }

  void showUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserInfoDialog();
      },
    );
  }

}
