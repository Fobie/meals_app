import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.meal
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                    meal.imageUrl,
                ),
      
            ),
            Positioned(
              bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
      
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
