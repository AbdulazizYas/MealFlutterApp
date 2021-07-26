import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutenfree = widget.currentFilters["gluten"];
    _lactosefree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
    _vegetarian = widget.currentFilters["vegetarian"];
    super.initState();
  }

  Widget buildSwitch(String title, String desc, bool value, Function changed) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desc),
      value: value,
      onChanged: changed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  "gluten":_glutenfree,
                  "lactose":_lactosefree,
                  "vegetarian":_vegetarian,
                  "vegan":_vegan,
                };
                widget.saveFilters(selectedFilters);
              }
        )],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch(
                  "Gluten-Free",
                  "Only include gluten-free meals",
                  _glutenfree,
                  (newVal) {
                    setState(() {
                      _glutenfree = newVal;
                    });
                  },
                ),
                buildSwitch(
                  "Lactose-Free",
                  "Only include lactose-free meals",
                  _lactosefree,
                      (newVal) {
                    setState(() {
                      _lactosefree = newVal;
                    });
                  },
                ),
                buildSwitch(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  _vegetarian,
                      (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                buildSwitch(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                      (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
