import 'package:flutter/material.dart';
import 'package:klimatic/ui/SecondPage.dart';
import 'ui/MainPage.dart';



void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Klimatic",
        theme: ThemeData(
            primaryColor: Colors.redAccent
        ),
        home: MainPage(),
      )
  );
}

