import 'package:flutter/material.dart';
import 'SignInPage.dart'; // Import your SignInPage file

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Logo
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, -50 * value),
                  child: Transform.scale(
                    scale: 1 + 0.2 * value,
                    child: Image.asset(
                      'assets/hsnc_logo.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Welcome Text
            Text(
              'Welcome to KC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sports Team App',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),

            // Buttons
            ElevatedButton(
              onPressed: () {
                // Handle the Google login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
                primary: Colors.white,
              ),
              child: Container(
                width: 319,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle the email login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
                primary: Color(0xff376aed),
              ),
              child: Container(
                width: 319,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'Login With Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle the Facebook login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
                primary: Color(0xff04754d),
              ),
              child: Container(
                width: 318,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'Login With Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Sign In Button with Navigation
            ElevatedButton(
              onPressed: () {
                // Navigate to SignInPage when the Sign In button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
                primary: Colors.blue, // Change the color as needed
              ),
              child: Container(
                width: 318,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
