import 'package:coin_convrt/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffdaa520))),
              hintStyle: TextStyle(
                color: Color(0xffdaa520),
              ))),
    );
  }
}
