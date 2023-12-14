import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meal_provider.dart';
import 'package:meals/screens/filter_screen.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterNotifier() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegan : false,
    Filter.vegetarian : false
  });

  void chosenFilter(Map<Filter, bool> chosenFilter){
    state = chosenFilter;
  }

  void setActive(Filter filter, bool isActive){
    state = {
      ...state,
      filter : isActive
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
} );

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filterProvider);
  meals.where((meal){
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
});