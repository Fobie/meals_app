import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.SelectedScreen
  });

  final void Function(String identifier) SelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fastfood, size: 50,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      'Cooking Up!!!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                    ),
                  )
                ],
              )
          ),
          ListTile(
            onTap: (){
              SelectedScreen('meals');
            },
            leading: Icon(Icons.restaurant),
            title: Text('Meals'),
          ),
          ListTile(
            onTap: (){
              SelectedScreen('filters');
            },
            leading: Icon(Icons.settings),
            title: Text('Filters'),
          )
        ],
      ),
    );
  }
}
