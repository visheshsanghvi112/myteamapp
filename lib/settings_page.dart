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
      body: SingleChildScrollView(
        child: Column(
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
            ListTile(
              title: Text('Allow Notifications'),
              trailing: Switch(
                value: true, // Replace with your logic to determine notification status
                onChanged: (value) {
                  // Handle notification toggle logic
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Team Information'),
              onTap: () {
                // Navigate to a screen to edit team information
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInformationScreen()));
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Manage Players'),
              onTap: () {
                // Navigate to a screen for player management
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePlayersScreen()));
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Match Settings'),
              onTap: () {
                // Navigate to a screen for match settings
                Navigator.push(context, MaterialPageRoute(builder: (context) => MatchSettingsScreen()));
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Notification Preferences'),
              onTap: () {
                // Navigate to a screen for notification preferences
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPreferencesScreen()));
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Statistics and Analytics'),
              onTap: () {
                // Navigate to a screen for statistics and analytics
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsAnalyticsScreen()));
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Sync with Calendar'),
              onTap: () {
                // Implement logic to sync with the device's calendar
                // You can call a method or navigate to a screen for calendar sync
              },
            ),

            // Language Selection Section
            const SizedBox(height: 20),
            ListTile(
              title: Text('Language'),
              subtitle: Text('Select your preferred language'),
              onTap: () {
                showLanguageDialog(context);
              },
            ),

            // Font Selection Section
            const SizedBox(height: 20),
            ListTile(
              title: Text('Font'),
              subtitle: Text('Select your preferred font'),
              onTap: () {
                showFontDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            children: [
              LanguageOptionItem('Hindi', 'hi', context),
              LanguageOptionItem('Marathi', 'mr', context),
              LanguageOptionItem('English', 'en', context),
              LanguageOptionItem('French', 'fr', context),
              LanguageOptionItem('Spanish', 'es', context),
            ],
          ),
        );
      },
    );
  }

  void showFontDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Font'),
          content: Column(
            children: [
              FontOptionItem('Font 1', context),
              FontOptionItem('Font 2', context),
              FontOptionItem('Font 3', context),
              FontOptionItem('Font 4', context),
              FontOptionItem('Font 5', context),
              FontOptionItem('Font 6', context),
              FontOptionItem('Font 7', context),
              FontOptionItem('Font 8', context),
              FontOptionItem('Font 9', context),
              FontOptionItem('Font 10', context),
            ],
          ),
        );
      },
    );
  }
}

class LanguageOptionItem extends StatelessWidget {
  final String language;
  final String locale;
  final BuildContext parentContext;

  LanguageOptionItem(this.language, this.locale, this.parentContext);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(language),
      onTap: () {
        // Implement language change logic
        // You may need to use a localization package like 'flutter_localizations'
        // to manage translations and locales
        Navigator.pop(context); // Close the dialog
        ScaffoldMessenger.of(parentContext).showSnackBar(
          SnackBar(
            content: Text('Language changed to $language'),
          ),
        );
      },
    );
  }
}

class FontOptionItem extends StatelessWidget {
  final String fontName;
  final BuildContext parentContext;

  FontOptionItem(this.fontName, this.parentContext);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fontName),
      onTap: () {
        // Implement font change logic
        // You may need to use a package like 'google_fonts' for custom fonts
        Navigator.pop(context); // Close the dialog
        ScaffoldMessenger.of(parentContext).showSnackBar(
          SnackBar(
            content: Text('Font changed to $fontName'),
          ),
        );
      },
    );
  }
}

class TeamInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Information'),
      ),
      body: Center(
        child: Text('Edit your team information here.'),
      ),
    );
  }
}

class ManagePlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Players'),
      ),
      body: Center(
        child: Text('Manage your team players here.'),
      ),
    );
  }
}

class MatchSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Settings'),
      ),
      body: Center(
        child: Text('Configure your match settings here.'),
      ),
    );
  }
}

class NotificationPreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Preferences'),
      ),
      body: Center(
        child: Text('Customize your notification preferences here.'),
      ),
    );
  }
}

class StatisticsAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics and Analytics'),
      ),
      body: Center(
        child: Text('View your team statistics and analytics here.'),
      ),
    );
  }
}
