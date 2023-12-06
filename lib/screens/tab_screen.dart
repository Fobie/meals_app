import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int selectedScreenIndex = 0;
  final List<Meal> favouriteMeal = [];

  void showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
                color: Colors.white
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        )
    );
  }

  void ToggleFavouriteMeal(Meal meal){
    final isExisting = favouriteMeal.contains(meal);
    if(isExisting){
      setState(() {
        favouriteMeal.remove(meal);
        showMessage('Removed from your favourites!');
      });
    } else {
      setState(() {
        favouriteMeal.add(meal);
        showMessage('Added to your favourites successfully');
      });
    }
  }

  void selectScreen(int index){
    setState(() {
      selectedScreenIndex = index;
    });
}

  void setScreen(String identifier) {
    if(identifier == "filters"){

    } else {
      Navigator.of(context).pop();
    }
  }



  @override
  Widget build(BuildContext context) {

  Widget activeScreen = CategoriesScreen(onToggleFavouriteMeal: (Meal meal) { ToggleFavouriteMeal(meal); },);
  String activeScreenTitle = "Categories";
  if(selectedScreenIndex == 1){
    activeScreen = MealScreen(meals: favouriteMeal, onToggleFavouriteMeal: (Meal meal) { ToggleFavouriteMeal(meal); },);
    activeScreenTitle = "Favourites";
}


  return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(SelectedScreen: (String identifier) {
        setScreen(identifier);
      },),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
          currentIndex: selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Categories"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favourites"
            ),
          ]
      ),
    );
  }
}
