import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import 'package:flutter/services.dart';
import 'package:sorting_hat/resultpage.dart';
import 'package:google_fonts/google_fonts.dart';
class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sorting Hat Quiz",
          style: TextStyle(
            fontFamily: 'Cabin',
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.deepPurple,
          actions: <Widget>[
      IconButton(
      icon: Icon(Icons.android),
      tooltip: 'Comment Icon',
      onPressed: () {
        _showToast(context);
        child: const Text('Show toast');
      },
    ),],
      ),
      body: getjson(),
    );
  }
}

class getjson extends StatelessWidget {
  const getjson({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/qna.json"),
      builder: (context, snapshot) {
        List mydata = [];
        mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("LOADING"),
            ),
          );
        } else {
          return quizstart(mydata: mydata);
        }
      },
    );
  }
}

class quizstart extends StatefulWidget {
  var mydata;
  quizstart({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizstartState createState() => _quizstartState(mydata);
}

class _quizstartState extends State<quizstart> {
  var mydata;
  _quizstartState(this.mydata);

  Color colortoshow = Colors.deepPurple;
  Color right = Colors.green;
  Color wrong = Colors.green;
  Color up = Colors.green;
  Color down = Colors.green;
  int marks=0;
  int G=0,S=0,R=0,H=0;
  String MAX;
  int i=1;
  Map<String,Color> btncolor={
    "a":Colors.deepPurple,
    "b":Colors.deepPurple,
    "c":Colors.deepPurple,
    "d":Colors.deepPurple,
  };

  void nextquestion(){
    setState(() {

    if(i<5)
      {
      i++;
      }
    else {
      if((G>S)&&(G>H)&&(G>R))
      {
        MAX=" Gryffindor";
      }
      else if((S>G)&&(S>H)&&(S>R))
      {
        MAX="Slytherin";
      }
      else if((H>S)&&(H>G)&&(H>R))
      {
        MAX="Hufflepuff ";
      }
      else
      {
        MAX="Ravenclaw";
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => resultpage(MAX : MAX),
    ));
    }
    btncolor["a"] = Colors.deepPurple;
    btncolor["b"] = Colors.deepPurple;
    btncolor["c"] = Colors.deepPurple;
    btncolor["d"] = Colors.deepPurple;

    });
  }

  void checkans(String k){
  if(mydata[1]["1"][k] == mydata[1]["1"]["a"])
    {
      S=S+1;
      marks=marks+5;
      colortoshow =right;
    }
  else if(mydata[1]["1"][k] == mydata[1]["1"]["b"])
  {
    H=H+1;
    marks=marks+5;
    colortoshow =up;
  }
 else if(mydata[1]["1"][k]== mydata[1]["1"]["c"])
  {
    G=G+1;
    marks=marks+5;
    colortoshow =down;
  }
  else{
    R=R+1;
    colortoshow =wrong;

  }
  setState(() {
    btncolor[k] = colortoshow;
  });

  Timer(Duration(seconds:2),nextquestion);

  }

  Widget options(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: MaterialButton(

        onPressed: () => checkans(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: btncolor[k],
        minWidth: 400,
        height: 45,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              " Do you want to Quit ?",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Yes"),
                    onPressed: () => exit(0),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                   style: ElevatedButton.styleFrom(
                       primary: Colors.deepPurple
                     ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mydata[0][i.toString()],
                    style: GoogleFonts.lato(
                      fontSize: 24,
                    ),

                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    options('a'),
                    SizedBox(
                      height: 30,
                    ),
                    options('b'),
                    SizedBox(
                      height: 30,
                    ),
                    options('c'),
                    SizedBox(
                      height: 30,
                    ),
                    options('d'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Developed By Sumit Banwakade'),
    ),
  );
}
