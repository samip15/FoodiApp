import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal_detail_screen";

  @override
  Widget build(BuildContext context) {
    final themeConst = Theme.of(context);
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    Widget _buildSectionTitle(String title, ThemeData themeConst) {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        child: Text(
          title,
          style: themeConst.textTheme.headline5
              .copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _buildSection({@required Widget child}) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle("Ingredients", themeConst),
            _buildSection(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: themeConst.primaryColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: themeConst.textTheme.subtitle2
                            .copyWith(fontSize: 15, color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildSectionTitle("Ingredients", themeConst),
            _buildSection(
              child: ListView.separated(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text("#${index + 1}"),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 3,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: themeConst.primaryColor,
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
