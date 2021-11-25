import 'package:flutter/material.dart';


import 'my_modified/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
//import 'my_modified/meal_detail_screen_secondview.dart';
import './screens/category_meals_screen.dart';
//import 'my_modified/tabs_screen_android.dart';
import 'my_modified/tabs_screen.dart';
import './screens/tabs_screen_bottom.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
        ),
      // home: CategoriesScreen(),
      routes: {
       // '/': (ctx) => CategoriesScreen(),
       '/': (ctx) => TabsScreenB(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        //MealDetailScreen2.routeName: (ctx) => MealDetailScreen2(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute (
          builder: (ctx) => CategoryMealsScreen());
      },
    );
  }
}

