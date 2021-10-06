import 'package:flutter/material.dart';
import 'package:sorting_hat/splash.dart';
void main() {
  runApp(sorthat());
}

class sorthat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Sorting Hat",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home:splashscreen(),
    );
  }
}
