import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';
import 'package:foodi_app/widget/category_item.dart';

class CategoryOverviewScreen extends StatelessWidget {
  static const String routeName = "/category_overview_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: DUMMY_CATEGORIES.map(
          (catData) {
            return CategoryItem(
              id: catData.id,
              color: catData.color,
              title: catData.title,
            );
          },
        ).toList(),
      ),
    );
  }
}
