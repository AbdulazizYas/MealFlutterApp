import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = "cat_meals";

  final List<Meal> avalibleMeals;

  CategoryMealsScreen(this.avalibleMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle;
  List<Meal> catMeals;
  @override
  void didChangeDependencies() {
    final Map<String, Object> routeArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String catId = routeArg['id'];
    catTitle = routeArg['title'];
    catMeals = widget.avalibleMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemCount: catMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            id: catMeals[i].id,
            title: catMeals[i].title,
            imageUrl: catMeals[i].imageUrl,
            duration: catMeals[i].duration,
            complexity: catMeals[i].complexity,
            affordability: catMeals[i].affordability,
          );
        },
      ),
    );
  }
}
