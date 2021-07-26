import 'package:flutter/material.dart';
import 'package:meal_app/sceens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title, style: TextStyle(
          fontSize: 24,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold
      ),),
      onTap: tabHandler,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme
                .of(context)
                .accentColor,
            child: Text("Cooking up!", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),),
          ),
          SizedBox(height: 20,),
          buildListTile("Meal", Icons.restaurant,()=> Navigator.of(context).pushReplacementNamed('/')),
          buildListTile("Filters", Icons.settings,()=> Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
