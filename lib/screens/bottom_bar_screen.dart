import 'package:flutter/material.dart';
import 'package:foodi_app/model/meal.dart';
import 'package:foodi_app/screens/category_overview_screen.dart';
import 'package:foodi_app/screens/favourite_screen.dart';
import 'package:foodi_app/widget/main_drawer.dart';

class BottomBarScreen extends StatefulWidget {
  static const String routeName = "/bottom_bar_screen";
  final List<Meal> _favourites;
  const BottomBarScreen(this._favourites);
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeConst = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      drawer: MainDrawer(),
      body: _selectedPageIndex == 0
          ? CategoryOverviewScreen()
          : FavouriteScreen(widget._favourites),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: themeConst.primaryColor,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            backgroundColor: themeConst.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
            backgroundColor: themeConst.primaryColor,
          ),
        ],
      ),
    );
  }
}
