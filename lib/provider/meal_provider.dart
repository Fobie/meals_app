import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/category_data.dart';


final mealProvider = Provider((ref) => dummyMeals);