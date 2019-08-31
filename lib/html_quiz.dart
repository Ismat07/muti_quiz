import 'package:flutter/material.dart';
import 'package:multiple_quiz/Summary.dart';
import 'package:multiple_quiz/lang_select.dart';


var finalScore = 0;
var questionNumber = 0;
const questionLeadings = ['A', 'B', 'C', 'D'];
var quiz = new Quiz_html();

class Quiz_html{

  var questions = [
    "1-  HTML is what type of language ?",
    "2-  The year in which HTML was first proposed _______. ",
    "3-  Fundamental HTML Block is known as ___________. ",
    "4-  Apart from <b> tag, what other tag makes text bold ? ",
  ];

  var choices = [
    ["Scripting Language", "Markup Language", "Programming Language", "Network Protocol"],
    ["1990", "1980", "2000", "1995"],
    ["HTML Body", "HTML Tag", "HTML Attribute", "HTML Element"],
    ["<fat>", "<strong>", "<black>", "<emp>"]
  ];

  var correctAnswers = ["Markup Language", "1990", "HTML Tag", "<strong>"];
}

class html_quiz extends StatefulWidget{
  final int questionNumber,finalScore;
  html_quiz({Key key, this.questionNumber, this.finalScore}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<html_quiz> {

  @override
  void initState() {
    super.initState();
    finalScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () => _exitApp(context),
        child: Scaffold(
          backgroundColor: Colors.cyanAccent[400],
          body: new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)
                    ),
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: new Text(
                          "Corrects : $finalScore out of ${quiz.questions.length}",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 22.0
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0,right: 20.0),
                  child: new Text(
                    quiz.questions[questionNumber],
                    style: new TextStyle(
                      color: Colors.indigo,
                      fontSize: 20.0,
                    ),
                  ),
                ),

                new Padding(padding: EdgeInsets.all(20.0)),
                Expanded(
                    child: new GridView.builder(
                      padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 20.0, right: 20.0),
                      itemCount: 4,
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 6.0,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 18.0
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return new GestureDetector(
                          child: new Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              ),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor:Colors.grey,
                                  child: Text(
                                    questionLeadings[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    ),
                                  )
                              ),
                              title: Text(
                                  "${quiz.choices[questionNumber][index]}",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ),
                          ),
                          onTap: () {
                            if (quiz.choices[questionNumber][index] == quiz.correctAnswers[questionNumber]) {
                              finalScore++;
                            }
                            updateQuestion();
                          },
                        );
                      },
                    )
                ),
              ],
            ),
          ),
        )
    );
  }

  void resetQuiz() {
    setState(() {
      questionNumber = 0;
      finalScore = 0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => new lang_select()),
      );
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        questionNumber = 0;
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new Summary(score: finalScore))
        );
      } else {
        questionNumber++;
      }
    });
  }

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Do you want to exit this application?'),
        content: new Text('Are you sure...'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('No'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          new FlatButton(
            child: new Text('Yes'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    ) ?? false;
  }
}
