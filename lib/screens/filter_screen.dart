import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";
  final Map<String, bool> filters;
  final Function setFilters;

  FilterScreen(this.filters, this.setFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactose = false;

  Widget _buildSwitchListTile(
      {@required String title,
      @required String desc,
      @required bool value,
      Function change}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desc),
      value: value,
      onChanged: change,
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    _lactose = widget.filters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    final themeConst = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Your Meals"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                "gluten": _glutenFree,
                "lactose": _lactose,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.setFilters(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Filters Here!",
              style: themeConst.textTheme.headline6,
            ),
          ),
          _buildSwitchListTile(
              title: "Gluten Free",
              desc: "Only Gluten Free Meals Are Selected",
              value: _glutenFree,
              change: (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
          _buildSwitchListTile(
              title: "Lactose Free",
              desc: "Only Lactose Free Meals Are Selected",
              value: _lactose,
              change: (value) {
                setState(() {
                  _lactose = value;
                });
              }),
          _buildSwitchListTile(
              title: "Vegan Free",
              desc: "Only Vegan Free Meals Are Selected",
              value: _vegan,
              change: (value) {
                setState(() {
                  _vegan = value;
                });
              }),
          _buildSwitchListTile(
              title: "Vegetarian Free",
              desc: "Only Vegetarian Free Meals Are Selected",
              value: _vegetarian,
              change: (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
        ],
      ),
    );
  }
}
