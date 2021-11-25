import 'dart:js';

import 'package:flutter/material.dart';

class  MainDrawer extends StatelessWidget {

  Widget buildListTile(String tileTitle,  IconData tileIcon){
    return ListTile(
            leading: Icon(
              tileIcon,
              size: 26,
              ),
            title: Text(
              tileTitle,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {

              },
          );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),

          SizedBox(height: 20,),

          ListTile(),
          
          ListTile(),
        ],
      ),
    );
  }
}