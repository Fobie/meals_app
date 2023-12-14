import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favourite_provider.dart';
import 'package:meals/provider/filter_provider.dart';
import 'package:meals/provider/meal_provider.dart';
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

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  int selectedScreenIndex = 0;



  void selectScreen(int index){
    setState(() {
      selectedScreenIndex = index;
    });
}

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == "filters"){
     await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) =>const FilterScreen(
              )
          )
      );
    }
  }



  @override
  Widget build(BuildContext context) {

    final meals = ref.watch(mealProvider);
    final activeFilters = ref.watch(filterProvider);
    final availableMeals = meals.where((meal){
      if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

  Widget activeScreen = CategoriesScreen(
    availableMeals: availableMeals,
  );
  String activeScreenTitle = "Categories";
  if(selectedScreenIndex == 1){
    final _favouriteMeals = ref.watch(favouriteMealProvider);
    activeScreen = MealScreen(
      meals: _favouriteMeals
    );
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