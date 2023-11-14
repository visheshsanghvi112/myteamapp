import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter your username to reset your password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await Hive.initFlutter();
                await Hive.openBox("accounts");

                String username = _usernameController.text;
                Box _boxAccounts = Hive.box("accounts");

                String storedPassword = _boxAccounts.get(username);

                if (storedPassword != null) {
                  // Display the password or send a reset email
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Your password is: $storedPassword'),
                    ),
                  );
                } else {
                  // Username not found logic
                  // Show an error message or perform other actions
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username not found!'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
