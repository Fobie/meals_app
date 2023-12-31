import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesGridWidget extends StatelessWidget {
  const CategoriesGridWidget({
    super.key,
    required this.category,
    required this.selectedCategory
  });

  final Category category;
  final void Function() selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
        ),
        child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        ),
      ),
    );
  }
}
