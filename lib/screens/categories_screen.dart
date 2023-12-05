import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/widget/categories_grid_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Dish'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
      children: [
        for(final category in availableCategories)
          CategoriesGridWidget(category: category)
    ]
      ),
    );
  }
}
