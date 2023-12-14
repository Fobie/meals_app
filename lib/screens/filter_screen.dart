import 'package:flutter/material.dart';
import 'package:meals/provider/filter_provider.dart';
import 'package:meals/widget/drawer_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterChanges = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
              value: filterChanges[Filter.glutenFree]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setActive(Filter.glutenFree, isChecked);
              },
              title: Text('Gluton-Free'),
              subtitle: Text('Only included gluton-free dishes'),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
              value: filterChanges[Filter.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setActive(Filter.lactoseFree, isChecked);
              },
              title: Text('Lactose-Free'),
              subtitle: Text('Only included lactose-free dishes'),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
              value: filterChanges[Filter.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setActive(Filter.vegetarian, isChecked);
              },
              title: Text('Vegetarian'),
              subtitle: Text('Only included vegetarian dishes'),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
              value: filterChanges[Filter.vegan]!,
              onChanged: (isChecked){
                ref.watch(filterProvider.notifier).setActive(Filter.vegan, isChecked);
              },
              title: Text('Vegan'),
              subtitle: Text('Only included vegan dishes'),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
