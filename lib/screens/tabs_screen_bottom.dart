import 'package:flutter/material.dart';

import './favorites-screen.dart';
import './categories_screen.dart';

class TabsScreenB extends StatefulWidget {

  @override
  _TabsScreenBState createState() => _TabsScreenBState();
}

class _TabsScreenBState extends State<TabsScreenB> {

  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
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
          title: Text('Meals',),
        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ]
        ),
      );
  }
}