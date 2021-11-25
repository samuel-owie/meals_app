import 'package:flutter/material.dart';

import './favorites-screen.dart';
import './categories_screen.dart';

class TabsScreenB extends StatefulWidget {

  @override
  _TabsScreenBState createState() => _TabsScreenBState();
}

class _TabsScreenBState extends State<TabsScreenB> {

  final List<Map<String, Object>> _pages = [
    {
      'page':CategoriesScreen(), 
      'title': 'Categories'
    },
    {
      'page':FavoritesScreen(), 
      'title': 'Your Favorites'
    },
  ];

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
        drawer: Drawer(
          child: Text('The Drawer'),
        ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
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