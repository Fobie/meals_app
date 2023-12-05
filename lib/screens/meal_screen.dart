import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';

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
      body: meals == null ?
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Uh Oh....Nothing Here'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Try new something delicious'
              )
            ],
          ),
        ) :
        ListView.builder(
          itemCount: meals.length,
            itemBuilder: (ctx,index){
            return Text(meals[index].title);
            }
        )
      ,

    );
  }
}
