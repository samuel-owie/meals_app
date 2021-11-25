import 'package:flutter/material.dart';

import './favorites-screen.dart';
import './categories_screen.dart';

class TabsScreenB extends StatefulWidget {

  @override
  _TabsScreenBState createState() => _TabsScreenBState();
}

class _TabsScreenBState extends State<TabsScreenB> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1, // selects the default tab that should be preselected
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals',),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: 
                  Icon(Icons.category), 
                  text: 'Categories',
                ),
              Tab(
                icon: 
                  Icon(Icons.star), 
                  text: 'Favorites',
              ),
            ],
            ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen(),
        ]
        ),
      ),
    );
  }
}