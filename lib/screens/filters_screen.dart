import 'package:flutter/material.dart';


import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

@override
initState() {
  _glutenFree = widget.currentFilters['gluten'];
  _vegetarian = widget.currentFilters['vegetarian'];
  _vegan = widget.currentFilters['vegan'];
  _lactoseFree = widget.currentFilters['lactose'];

  super.initState();
}


  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ){

    return SwitchListTile(
                  title: Text(title),
                  subtitle: Text(description),
                  value: currentValue, 
                  onChanged: updateValue,
                 );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                      'gluten' : _glutenFree,
                      'vegetarian' : _vegetarian,
                      'vegan' : _vegan,
                      'lactose' : _lactoseFree,
                    };
              widget.saveFilters(selectedFilters);
            }, 
            icon: Icon(Icons.save),
            )
        ],
        ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
              ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include gluten-free meals', 
                  _glutenFree, 
                  (newValue){
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Vegetarian', 
                  'Only include vegetarian meals', 
                  _vegetarian, 
                  (newValue){
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Vegan', 
                  'Only include vegan meals', 
                  _vegan, 
                  (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'lactose-free', 
                  'Only include lactose-free meals', 
                  _lactoseFree, 
                  (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }
                ),
              ],
            )
          )
        ]
      ),
    );
  }
}