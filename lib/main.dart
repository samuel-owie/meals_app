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
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'vegetarian' : false,
    'vegan' : false,
    'lactose' : false,
  };

  List<Meal> _availableMeals =DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        //MealDetailScreen2.routeName: (ctx) => MealDetailScreen2(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute (
          builder: (ctx) => CategoryMealsScreen(_availableMeals));
      },
    );
  }
}

