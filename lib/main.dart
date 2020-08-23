import 'package:flutter/material.dart';
import './screens/home_screens.dart';

void main() {
  runApp(MaterialApp(
    home: Dribble(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dribble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HomeScreen(),
    );
  }
}
