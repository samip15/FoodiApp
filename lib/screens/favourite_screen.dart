import 'package:flutter/material.dart';
import 'package:foodi_app/model/meal.dart';
import 'package:foodi_app/widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = "/favourite_screen";
  final List<Meal> favourites;

  const FavouriteScreen(this.favourites);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return MealItem(
          title: favourites[i].title,
          imageUrl: favourites[i].imageUrl,
          complexity: favourites[i].complexity,
          affordability: favourites[i].affordability,
          duration: favourites[i].duration,
          id: favourites[i].id,
        );
      },
      itemCount: favourites.length,
    );
  }
}
