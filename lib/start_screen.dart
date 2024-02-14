import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
    const StartScreen(this.startQuiz , {super.key});

    final void Function() startQuiz;

   @override
   Widget build(context){
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height:250,
              ),
             const SizedBox(height: 10),
             Text(
               'Are you geared up for this?',
             style: GoogleFonts.arefRuqaa(
               color: Colors.white,
               fontSize: 20,
              ),
             ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: Text('Start Quiz',
                  style: GoogleFonts.arefRuqaa(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
          ],
          ),
        );
   }
}