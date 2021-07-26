import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "meal_detail";

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme
          .of(ctx)
          .textTheme
          .headline6,),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            ),

            buildSectionTitle(context, "Ingredients"),

            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, i) =>
                  Card(
                    color: Theme
                        .of(ctx)
                        .accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[i]),
                    ),
                  ),
            ),),

            buildSectionTitle(context, "Steps"),

            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx,i) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${i +1}"),
                    ),
                    title: Text(selectedMeal.steps[i]),
                  ),
                  Divider(),
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }
}
