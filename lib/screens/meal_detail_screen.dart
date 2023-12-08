import 'package:flutter/material.dart';
import 'package:meals/const/strings.dart';

import '../models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavouriteMeal});

  final Meal meal;
  final void Function(Meal meal) onToggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
                onToggleFavouriteMeal(meal);
              },
              icon: Icon(Icons.star)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(
              height: 10,
            ),
            Text(
                kIngredientText,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.deepOrangeAccent
                )
            ),
            SizedBox(
              height: 10,
            ),
            for(final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
            Text(
                kStepsText,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.deepOrangeAccent
                )
            ),
            SizedBox(
              height: 10,
            ),
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}