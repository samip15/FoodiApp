import 'package:flutter/material.dart';
import 'package:foodi_app/screens/bottom_bar_screen.dart';
import 'package:foodi_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeConst = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
              ),
              accountName: Text("Samip"),
              accountEmail: Text("samipgnyawali15@gmail.com")),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Meals"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BottomBarScreen.routeName);
            },
          ),
          Divider(
            thickness: 1.5,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Filters"),
            onTap: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
