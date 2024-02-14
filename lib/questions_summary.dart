import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
       const QuestionsSummary(this.summaryData, {super.key});

       final List<Map<String , Object>> summaryData;

       @override
       Widget build(context) {
         return SizedBox(
           height : 300,
           child : SingleChildScrollView(
              child : Column(
               children: summaryData.map(
                   (data) {
                     return Row(
                       children: [
                         // Text(((data['question_index'] as int) + 1).toString() ,
                         //   style: GoogleFonts.arefRuqaa(
                         //     color: Colors.white,
                         //     fontSize: 30,
                         //   ),
                         // ),
                         Expanded(
                           child: Column(
                             children: [
                               Text(data['question'] as String,
                               style: GoogleFonts.arefRuqaa(
                                 color: Colors.white,
                                 fontSize: 30,
                                 ),
                               ),
                               const SizedBox(
                                 height: 5,
                               ),
                               Text(data['user_answer'] as String ,
                                 style: GoogleFonts.arefRuqaa(
                                   color: const Color.fromARGB(255, 170, 225, 225),
                                   fontSize: 30,
                                 ),
                               ),
                               Text(data['correct_answer'] as String ,
                                 style: GoogleFonts.arefRuqaa(
                                   color: Colors.green,
                                   fontSize: 30,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     );
                   }
           ).toList(),),
           ),
         );
       }
}