import 'package:flutter/material.dart';
import 'package:meals/widget/drawer_widget.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan

}

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.currentFilters
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var isGlutenFreeState = false;
  var isLactoseFreeState = false;
  var isVegetarianState = false;
  var isVeganState = false;

  @override
  void initState() {
    super.initState();
    isGlutenFreeState = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFreeState = widget.currentFilters[Filter.lactoseFree]!;
    isVegetarianState = widget.currentFilters[Filter.vegetarian]!;
    isVeganState = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFreeState,
            Filter.lactoseFree: isLactoseFreeState,
            Filter.vegetarian: isVegetarianState,
            Filter.vegan: isVeganState,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
                value: isGlutenFreeState,
                onChanged: (isChecked){
                  setState(() {
                    isGlutenFreeState = isChecked;
                  });
                },
                title: Text('Gluton-Free'),
                subtitle: Text('Only included gluton-free dishes'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
                value: isLactoseFreeState,
                onChanged: (isChecked){
                  setState(() {
                    isLactoseFreeState = isChecked;
                  });
                },
                title: Text('Lactose-Free'),
                subtitle: Text('Only included lactose-free dishes'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
                value: isVegetarianState,
                onChanged: (isChecked){
                  setState(() {
                    isVegetarianState = isChecked;
                  });
                },
                title: Text('Vegetarian'),
                subtitle: Text('Only included vegetarian dishes'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
                value: isVeganState,
                onChanged: (isChecked){
                  setState(() {
                    isVeganState = isChecked;
                  });
                },
                title: Text('Vegan'),
                subtitle: Text('Only included vegan dishes'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
