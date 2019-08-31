import 'package:flutter/material.dart';
import 'package:circle_list/circle_list.dart';
import 'package:multiple_quiz/lang_cont/my_controller.dart';
import 'package:multiple_quiz/android_quiz.dart';
import 'package:multiple_quiz/c_plus_quiz.dart';
import 'package:multiple_quiz/html_quiz.dart';
import 'package:multiple_quiz/java_quiz.dart';
import 'package:multiple_quiz/python_quiz.dart';
import './c_quiz.dart';

var finalScore = 0;
var questionNumber = 0;

class lang_select  extends StatefulWidget {
  @override
  _ShowDemoPageTwoState createState() => _ShowDemoPageTwoState();
}

class _ShowDemoPageTwoState extends State<lang_select > {
  MyController myController;
  int select_index;

  @override
  void initState() {
    super.initState();
    myController = MyController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[400],
      body: Center(
        child: CircleList(
          origin: Offset(0, 0),
          centerWidget: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.asset("images/background.jpg")
          ),
          children: List.generate(6, (index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    select_index = index;
                  });
                  startQuiz(select_index);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: Container(
                      //color: Colors.blue,
                      width: 70,
                      height: 70,
                      child: Image.asset("images/${index + 1}.jpg"),
                    )
                )
            );
          }),
          onDragUpdate: (update) {
            Offset point = Offset(update.point.dx * 2, update.point.dy * 2);
            myController.lookAt(point);
          },
        ),
      ),
    );
  }

  void startQuiz(int select_index) {
    switch (select_index) {
      case 0:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new android_quiz(
                    questionNumber: questionNumber,
                    finalScore: finalScore)
            )
        );
        break;

      case 1:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new c_quiz(
                    /*questionNumber: questionNumber,
                    finalScore: finalScore*/
                )
            )
        );
        break;

      case 2:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new c_plus_quiz(
                    questionNumber: questionNumber,
                    finalScore: finalScore)
            )
        );
        break;

      case 3:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new html_quiz(
                    questionNumber: questionNumber,
                    finalScore: finalScore)
            )
        );
        break;

      case 4:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new java_quiz(
                    questionNumber: questionNumber,
                    finalScore: finalScore)
            )
        );
        break;

      case 5:
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new python_quiz(
                    questionNumber: questionNumber,
                    finalScore: finalScore)
            )
        );
        break;
    }
  }
}