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
              duration: const Duration(milliseconds: 500),
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
            const SizedBox(height: 20),

            // Welcome Text
            const Text(
              'Welcome to KC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Sports Team App',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),

            // Buttons
            ElevatedButton(
              onPressed: () {
                // Handle the Google login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: Colors.white,
              ),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle the email login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: const Color(0xff376aed),
              ),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Login With Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle the Facebook login action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: const Color(0xff0e5d0e),
              ),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Login With Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

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
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: Colors.blue, // Change the color as needed
              ),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
