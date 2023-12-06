import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widget/meal__item_widget.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavouriteMeal
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavouriteMeal;

  void SelectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => MealDetailScreen(
        meal: meal,
        onToggleFavouriteMeal: (Meal meal) {
          onToggleFavouriteMeal(meal);
        },))
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content = meals.isEmpty ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uh Oh....Nothing Here',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try new something delicious',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
            ),
          )
        ],
      ),
    ) : ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index){
          return MealItemWidget(
            meal: meals[index],
            onSelectMeal: (BuildContext context, Meal meal) {
              SelectMeal(context, meal);
            },);
        }
    );

    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content

    );
  }
}
