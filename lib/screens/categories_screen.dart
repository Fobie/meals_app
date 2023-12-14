import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/categories_grid_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category){


    final selectedMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
            title: category.title,
            meals: selectedMeals,
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
      builder: (context, child){
          return SlideTransition(
            position: Tween(
              begin: Offset(0, 1),
              end: Offset(0, 0  )
            ).animate(
              CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeInOut
              )
            ),
              child: child
          );
      },
    );
  }
}
