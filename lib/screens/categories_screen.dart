import 'package:flutter/material.dart';


import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //this screen now belongs to the scaffold of the tabs screen, hence only
    // Gridview should be returned.
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('DeliMeal'),
    //   ),
    //   body: 
    return  GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map(
          (catData) => CategoryItem(
            catData.id, 
            catData.title, 
            catData.color,
            )
            ).toList(), 

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisExtent: 135,
        )
    );
  }
}