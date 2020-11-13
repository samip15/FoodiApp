import 'package:flutter/material.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';
import 'package:foodi_app/screens/category_overview_screen.dart';
import 'package:foodi_app/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodi App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange[800],
        accentColor: Colors.redAccent,
        fontFamily: "SourceCodePro",
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
                fontFamily: "TurretRoad",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
      initialRoute: CategoryOverviewScreen.routeName,
      routes: {
        CategoryOverviewScreen.routeName: (ctx) => CategoryOverviewScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryOverviewScreen());
      },
    );
  }
}
