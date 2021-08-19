import 'package:flutter/material.dart';

Text title(String text, {double size = 42, Color color}) {
  return Text(
    text,
    style: TextStyle(fontFamily: "Bebas", fontSize: size, color: color),
    textAlign: TextAlign.center,
  );
}
