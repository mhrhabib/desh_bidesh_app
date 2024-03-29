import 'package:desh_bidesh_app/Screens/all_countries_screens.dart';
import 'package:desh_bidesh_app/animation/counter_animator.dart';
import 'package:flutter/material.dart';

import 'animation/animated_main.dart';
import 'animation/hero_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: AllCountriesScreen(),
    );
  }
}
