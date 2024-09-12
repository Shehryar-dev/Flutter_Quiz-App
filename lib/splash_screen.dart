import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'name_input_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 30), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NameInputScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg', // Your background image path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            // child: Text(
            //   "Quiz Loading...",
            //   style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold,fontFamily: "radicalFont",color: Colors.white),
            // ),
            child: Image.asset('assets/icons/load1.gif'),
          ),
        ],
      ),
    );
  }
}
