import 'package:flutter/material.dart';
import 'package:sorting_hat/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[800]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: new AssetImage('assets/hat.png'),
                        height: 350.0,
                        width: 350.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Sorting Hat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontFamily: 'Parry Hotter',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 120.0),
                child: Container(
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => home()),
                      );
                      },
                     child: Text('Start Quiz',
                     style: TextStyle(
                       fontSize: 18.0,
                     )
                     ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(151, 87, 174, 1),
                       minimumSize: Size(200,50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
