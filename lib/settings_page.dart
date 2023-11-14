import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return SwitchListTile(
                  title: Text('Dark Mode'),
                  value: themeProvider.themeData == ThemeData.dark(),
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            // Additional settings can be added here
            ListTile(
              title: Text('Allow Notifications'),
              trailing: Switch(
                value: true, // Replace with your logic to determine notification status
                onChanged: (value) {
                  // Handle notification toggle logic
                },
              ),
            ),
            // Add more settings as needed
          ],
        ),
      ),
    );
  }
}
