import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/const/strings.dart';
import 'package:meals/provider/favourite_provider.dart';

import '../models/meal_model.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favouriteMeal = ref.watch(favouriteMealProvider);
    final isFavourite = favouriteMeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
                final wasAdded = ref.read(favouriteMealProvider.notifier).toggleMealFavouriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                        wasAdded ? "Successfully added to favourite" : "Successfully removed from favourite"
                      )
                  )
                );
              },
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation){
                    return RotationTransition(
                        turns: Tween<double>(
                          begin: 0.8,
                          end: 1
                        ).animate(animation),
                      child: child,
                    );
                  },
                  child: Icon(isFavourite ? Icons.star : Icons.star_border,key: ValueKey(isFavourite),),
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meal.id,
            child: Image.network(meal.imageUrl)),
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
                padding: const EdgeInsets.all(8.0),
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