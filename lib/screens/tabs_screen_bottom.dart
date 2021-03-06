import 'package:flutter/material.dart';

import './favorites-screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreenB extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreenB(this.favoriteMeals);

  @override
  _TabsScreenBState createState() => _TabsScreenBState();
}

class _TabsScreenBState extends State<TabsScreenB> {

  List<Map<String, Object>> _pages;


  void initState(){
   _pages = [
    {
      'page':CategoriesScreen(), 
      'title': 'Categories'
    },
    {
      'page':FavoritesScreen(widget.favoriteMeals), 
      'title': 'Your Favorites'
    },
  ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'],),

        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          //unselectedItemColor: Colors.white,
          //selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ]
        ),
      );
  }
}