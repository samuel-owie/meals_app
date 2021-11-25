import 'package:flutter/material.dart';


import '../screens/favorites-screen.dart';
import '../screens/categories_screen.dart';

class TabsScreenA extends StatefulWidget {

  @override
  _TabsScreenAState createState() => _TabsScreenAState();
}

class _TabsScreenAState extends State<TabsScreenA> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 1, // selects the default tab that should be preselected
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