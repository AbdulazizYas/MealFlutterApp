import 'package:flutter/material.dart';
import 'package:meal_app/sceens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void goCatMeals(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id' : this.id,
        'title':this.title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goCatMeals(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                this.color.withOpacity(0.5),
                this.color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
