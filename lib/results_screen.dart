import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen( { super.key , required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;


  List<Map<String,Object>>  get summaryData{
       final  List<Map<String,Object>> summary = [];

       for(var i = 0 ; i < chosenAnswer.length ; i++)
         {
           summary.add(
             {
             'question_index' : i,
              'question': questions[i].text,
              'correct_answer' : questions[i].answers[0],
              'user_answer' : chosenAnswer[i],
           },
           );
         }
       return summary;
  }


  @override
  Widget build(context)
  {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
            (data) => data['user_answer'] == data['correct_answer'],
    ).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children :[
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                style: GoogleFonts.arefRuqaa(
                  color: Colors.yellow,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height : 30,
              ),
              QuestionsSummary(summaryData),
              TextButton(
               onPressed: onRestart,
               child: Text('Restart Quiz!' ,
                style: GoogleFonts.arefRuqaa(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
           ),
          ],
        ),
      ),
    );
  }

}