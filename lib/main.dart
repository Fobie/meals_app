import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/category_data.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0),
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: MealScreen(title: "some category", meals: dummyMeals),
    );
  }
}