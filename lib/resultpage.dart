import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {

  String MAX;
  resultpage({this.MAX});

  @override
  _resultpageState createState() => _resultpageState(MAX);
}

class _resultpageState extends State<resultpage> {
  String MAX;
  _resultpageState(this.MAX);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Result"),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Container(
        color: Colors.deepPurple,
        child:Center(
          child: Text("You belongs to \n $MAX ",
            style: TextStyle(
            fontSize: 48.0,
            fontFamily: "Parry Hotter",
            ),
          ),
        ),
      ),
    );
  }
}
