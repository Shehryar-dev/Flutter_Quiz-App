import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'name_input_screen.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final int score;

  ResultScreen({required this.name, required this.score});

  @override
  Widget build(BuildContext context) {
    int totalMarks = 20;  // Total marks for both quizzes (5 questions each with 2 marks)

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Quiz Result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 62,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'radicalFont',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 80,),
          Align(

            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 280),
              width: 290,
              height: 290,
              child: Image.asset('assets/icons/checkmark.png'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0,left: 16.0,right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Text(
                    "Congratulations $name!",
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold,color: Colors.white, fontFamily: 'radicalFont'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your total score is: $score / $totalMarks",
                    style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'Branch',fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NameInputScreen()),
                      );
                    },
                    child: Text("Restart Quiz",),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
