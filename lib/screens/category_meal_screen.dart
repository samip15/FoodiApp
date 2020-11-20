import 'package:flutter/material.dart';
import 'package:foodi_app/model/meal.dart';
import 'package:foodi_app/widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/category_meal_screen";
  final List<Meal> availableMeals;
  const CategoryMealScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final catId = routeArgs["catId"];
    final catTitle = routeArgs["catTitle"];
    final catMeals = availableMeals
        .where((meal) => meal.categories.contains(catId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            title: catMeals[i].title,
            imageUrl: catMeals[i].imageUrl,
            complexity: catMeals[i].complexity,
            affordability: catMeals[i].affordability,
            duration: catMeals[i].duration,
            id: catMeals[i].id,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
