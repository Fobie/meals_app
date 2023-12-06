import 'package:flutter/material.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/drawer_widget.dart';

const kInitialValues = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegetarian : false,
  Filter.vegan : false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int selectedScreenIndex = 0;
  final List<Meal> favouriteMeal = [];
  Map<Filter, bool> selectedMeals = kInitialValues;

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

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == "filters"){
      final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilters: selectedMeals,)));

      setState(() {
        selectedMeals = result ?? kInitialValues;
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal){
      if(selectedMeals[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(selectedMeals[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(selectedMeals[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(selectedMeals[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

  Widget activeScreen = CategoriesScreen(
    onToggleFavouriteMeal: ToggleFavouriteMeal,
    availableMeals: availableMeals,
  );
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
