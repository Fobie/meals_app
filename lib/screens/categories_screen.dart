import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/categories_grid_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, Category category){

    final selectedMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
            title: category.title,
            meals: selectedMeals
        )
    )
    );
  }

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
          CategoriesGridWidget(
            category: category,
            selectedCategory: (){
              _selectedCategory(context, category);
            },)
    ]
      ),
    );
  }
}
