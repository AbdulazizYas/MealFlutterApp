import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/sceens/category_screen.dart';
import 'package:meal_app/sceens/favorite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages;

  @override
  initState(){
    _pages = [
      {
        "page" : CategoriesScreen(),
        "title": "Categories"
      },
      {
        "page" : FavoriteScreen(widget.favoriteMeals),
        "title": "My Favorites"
      }
    ];
    super.initState();
  }
  int _selectedPageIndex = 0;
  void _selectedPage(int value){
    setState(() {
      _selectedPageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]["title"]),),

      body: _pages[_selectedPageIndex]["page"],

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),

      drawer: MainDrawer(),
    );
  }
}
