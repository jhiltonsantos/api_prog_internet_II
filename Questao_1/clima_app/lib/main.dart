import 'package:climaapp/screens/loading_screen.dart';
import 'package:climaapp/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    ),
  );
}
