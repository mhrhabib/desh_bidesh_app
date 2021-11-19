import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  final String name;
  CountryScreen(
    this.name,
  );

  List number = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ListView(
          children: number.map((n) => Text(n.toString())).toList(),
        ),
      ),
    );
  }
}
