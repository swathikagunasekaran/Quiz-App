import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget
{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>
{

  var activeScreen = 'start-screen';
   List<String> _selectedAnswers = [];

  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length){
      setState((){
        activeScreen = 'results-screen';
      });
    }
  }

  void selectStart()
  {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'start-screen';

    });
  }


  @override
  Widget build(context) {
    // var screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(
        chosenAnswer: _selectedAnswers,
        onRestart: selectStart,
      );
    }

    return MaterialApp(
        home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient : LinearGradient(
                  colors:[
                    Colors.black,
                    Colors.redAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: screenWidget,
            ),
        ),
    );
  }
}