import 'package:flutter/material.dart';
import 'package:myteamapp/welcome_page.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcomePage();
  }

  // Function to navigate to the welcome page after a delay
  void _navigateToWelcomePage() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Image.asset(
            'assets/hsnc_logo.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
