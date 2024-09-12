import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String name;
  final String quizCategory;

  QuizScreen({required this.name, required this.quizCategory});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOption;
  String currentQuizCategory = 'Computer'; // Start with Computer quiz

  final Map<String, List<Map<String, Object>>> _quizzes = {
    'Computer': [
      {'question': 'What is CPU?', 'options': ['Central Processing Unit', 'Control Panel Unit', 'Central Power Unit', 'Computer Processing Unit'], 'answer': 0},
      {'question': 'Is Python a programming language?', 'options': ['Yes', 'No', 'Maybe', 'None of these'], 'answer': 0},
      {'question': 'HTML stands for Hypertext Machine Language?', 'options': ['True', 'False'], 'answer': 1},
      {'question': 'Is Java used for web development?', 'options': ['Yes', 'No', 'Partially', 'Depends on usage'], 'answer': 0},
      {'question': 'Is RAM a storage device?', 'options': ['Yes', 'No'], 'answer': 1},
    ],
    'Maths': [
      {'question': 'What is 2 + 2?', 'options': ['3', '4', '5', '6'], 'answer': 1},
      {'question': 'What is the square root of 16?', 'options': ['3', '5', '4', '6'], 'answer': 2},
      {'question': 'What is 5 * 5?', 'options': ['25', '20', '15', '10'], 'answer': 0},
      {'question': 'What is 10 / 2?', 'options': ['4', '3', '5', '6'], 'answer': 2},
      {'question': 'Solve 3x = 9, x = ?', 'options': ['1', '3', '5', '9'], 'answer': 1},
    ],
  };

  // List of images for the background
  final List<String> _backgroundImages = [
    'assets/icons/bg_3.png',
    'assets/icons/bg_1.png',
    'assets/icons/bg_2.png',
    'assets/icons/bg_4.png',
  ];

  void _answerQuestion() {
    if (_selectedOption == _quizzes[currentQuizCategory]![_currentQuestionIndex]['answer']) {
      _score += 2;
    }

    if (_currentQuestionIndex < _quizzes[currentQuizCategory]!.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOption = null;
      });
    } else {
      // If the Computer quiz is complete, start Maths quiz
      if (currentQuizCategory == 'Computer') {
        setState(() {
          currentQuizCategory = 'Maths';
          _currentQuestionIndex = 0;
          _selectedOption = null;
        });
      } else {
        // End of Maths quiz, show the result
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(name: widget.name, score: _score),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background SVG image
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
                "$currentQuizCategory Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontFamily: 'radicalFont',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 320),
              width: 280,
              height: 280,
              child: Image.asset(
                _backgroundImages[_currentQuestionIndex % _backgroundImages.length],
              ),
            ),
          ),
          SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(top: 350),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Question ${_currentQuestionIndex + 1}",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'radicalFont',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _quizzes[currentQuizCategory]![_currentQuestionIndex]['question'] as String,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Branch',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  // Radio buttons for options
                  ...(_quizzes[currentQuizCategory]![_currentQuestionIndex]['options'] as List<String>).asMap().entries.map((option) {
                    return RadioListTile<int>(
                      title: Text(
                        option.value,
                        style: TextStyle(color: Colors.white70),
                      ),
                      value: option.key,
                      activeColor: Colors.white70,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    );
                  }).toList(),
                  SizedBox(height: 12),
                  // Submit button
                  ElevatedButton(
                    onPressed: _selectedOption != null ? _answerQuestion : null,
                    child: Text("Submit Answer"),
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
