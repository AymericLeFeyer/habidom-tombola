import 'package:flutter/material.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habirandom',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Roboto",
          splashColor: MyColors.orange,
          canvasColor: MyColors.orange,
          hoverColor: MyColors.orange),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
