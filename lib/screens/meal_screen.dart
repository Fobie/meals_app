import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widget/meal__item_widget.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty ?
        Center(
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
        ) :
        ListView.builder(
          itemCount: meals.length,
            itemBuilder: (ctx,index){
            return MealItemWidget(meal: meals[index]);
            }
        )
      ,

    );
  }
}
