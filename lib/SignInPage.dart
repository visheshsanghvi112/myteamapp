import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'ForgotPasswordPage.dart';
import 'home.dart'; // Import home.dart

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> checkLoginCredentials(String username, String password) async {
    // Replace this with your authentication logic
    // For now, assume successful login for any non-empty username and password
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0.0, -50 * (1 - value)),
                      child: Transform.scale(
                        scale: 1 + 0.2 * (1 - value),
                        child: Image.asset(
                          'assets/hsnc_logo.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  bool isValidCredentials = await checkLoginCredentials(username, password);

                  if (isValidCredentials) {
                    if (username.toLowerCase() == 'admin') {
                      showDialog(
                        context: context,
                        builder: (context) => _buildAdminDialog(context),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => _buildErrorDialog(context),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: _buildLoginButton(),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                ),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: const Text('Forgot password? Reset here'),
              ),
              const SizedBox(height: 20),
              _buildCreateAccountLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Welcome Admin!'),
      content: Text('You have successfully logged in.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  Widget _buildErrorDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Invalid Credentials'),
      content: Text('Please check your username and password.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildCreateAccountLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account yet?"),
        const SizedBox(width: 5),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          ),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: const Text(
            'Create an account',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
