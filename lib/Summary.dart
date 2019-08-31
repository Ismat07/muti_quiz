import 'package:flutter/material.dart';
import 'package:multiple_quiz/lang_select.dart';

class Summary extends StatefulWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Summary> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent[400],
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 170.0, bottom: 50.0, left: 350.0, right: 20.0)),
              new Text(
                "Final Score: ${widget.score}",
                style: new TextStyle(
                    color: Colors.indigo,
                    fontSize: 35.0
                ),
              ),

              new Padding(padding: EdgeInsets.all(30.0)),
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top:30.0,left:110.0)),
                  new MaterialButton(
                    color: Colors.white,
                    child: new Text(
                      "Reset Quiz",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.indigo,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => new lang_select())
                      );
                    },
                  ),

                  /*new Padding(padding: EdgeInsets.only(top:30.0,right:30.0)),
                  new MaterialButton(
                    color: Colors.white,
                    child: new Text(
                      "Answers",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.indigo,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => new lang_select())
                      );
                    },
                  )*/
                ]
              )
            ],
          ),
        ),
    );
  }
}