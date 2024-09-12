import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'quiz_screen.dart';

class NameInputScreen extends StatefulWidget {
  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 190),
                    width:290,
                    height: 290,
                    child: Image.asset('assets/icons/bg_1.png'),
                  ),
                  SizedBox(height: 10,),
                  Text("Enter Your Name",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'radicalFont'),),
                  SizedBox(height: 15,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _nameController,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      labelText: "Enter your name",
                      labelStyle: TextStyle(color: Colors.white70),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white70))
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              name: _nameController.text,
                              quizCategory: 'Computer',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Start Quiz"),
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
