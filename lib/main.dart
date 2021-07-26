import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/sceens/category_meals_screen.dart';
import 'package:meal_app/sceens/category_screen.dart';
import 'package:meal_app/sceens/filter_screen.dart';
import 'package:meal_app/sceens/meal_detail_screen.dart';
import 'package:meal_app/sceens/tabs_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten":false,
    "lactose":false,
    "vegetarian":false,
    "vegan":false,
  };

  List<Meal> _avalibleMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filtersData){
    setState(() {
      _filters = filtersData;

      _avalibleMeals = DUMMY_MEALS.where((meal) {
        if(_filters["gluten"] && !meal.isGlutenFree){
          return false;
        }
        if(_filters["lactose"] && !meal.isLactoseFree){
          return false;
        }
        if(_filters["vegetarian"] && !meal.isVegetarian){
          return false;
        }
        if(_filters["vegan"] && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }


  }

  bool _isFavorite(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        )
      ),
      title: 'Meal App',
      //home: MyHomePage(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_avalibleMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,_isFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,

    );
  }
}
/*
Notes for editing:
- go to category_item file and go to goCatMeals() function
  and try to delete .of(ctx) so if it will work as usual or not

 */
