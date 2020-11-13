import 'package:flutter/material.dart';
import 'package:foodi_app/model/meal.dart';
import 'package:foodi_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.id});

  String _getComplexity(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Difficult:
        return "Difficult";
    }
  }

  String _getAfforadible(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeConst = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: id);
      },
      child: Card(
          margin: const EdgeInsets.all(15),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      width: 225,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: themeConst.textTheme.headline5
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$duration min",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            _getComplexity(complexity),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            _getAfforadible(affordability),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
