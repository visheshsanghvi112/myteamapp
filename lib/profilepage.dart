import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "John Doe";
  String userRole = "Team Captain";
  String userEmail = "john.doe@example.com";
  String userPhoneNumber = "123-456-7890";
  String userPosition = "Forward";
  String userDateOfBirth = "January 1, 1990";
  String userDescription =
      "Passionate about the game and always striving for excellence. Let's achieve greatness together!";
  String? imageUrl;

  List<String> achievements = ["Champion 2020", "Runner-up 2019", "Best Player 2018"];
  List<String> schedule = ["Match 1 - Dec 10, 2023", "Match 2 - Dec 15, 2023"];
  List<String> teamRoster = ["Player 1", "Player 2", "Player 3"];

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit profile action
              // Add navigation to the edit profile page
              // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Photo
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: imageUrl != null ? FileImage(File(imageUrl!)) : null,
                child: imageUrl == null
                    ? Icon(Icons.camera_alt, size: 80, color: Colors.grey)
                    : null,
              ),
            ),

            // User Details
            Card(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(userRole),
                    SizedBox(height: 8.0),
                    Text(userEmail),
                    SizedBox(height: 8.0),
                    Text(userPhoneNumber),
                    SizedBox(height: 8.0),
                    Text(userPosition),
                    SizedBox(height: 8.0),
                    Text("DOB: $userDateOfBirth"),
                    SizedBox(height: 16.0),
                    Text(userDescription),
                  ],
                ),
              ),
            ),

            // Achievements Section
            SectionTitle(title: 'Achievements'),
            Column(
              children: achievements.map((achievement) => ListItem(text: achievement)).toList(),
            ),

            // Schedule Section
            SectionTitle(title: 'Schedule'),
            Column(
              children: schedule.map((event) => ListItem(text: event)).toList(),
            ),

            // Team Roster Section
            SectionTitle(title: 'Team Roster'),
            Column(
              children: teamRoster.map((player) => ListItem(text: player)).toList(),
            ),

            // Additional Features
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle follow team action
                // This is a placeholder, add actual functionality
                print('Following the team!');
              },
              child: Text('Follow Team'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle send message action
                // This is a placeholder, add actual functionality
                print('Sending a message');
              },
              child: Text('Send Message'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle view events action
                // This is a placeholder, add actual functionality
                print('Viewing upcoming events');
              },
              child: Text('View Upcoming Events'),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for section titles
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Custom widget for list items
class ListItem extends StatelessWidget {
  final String text;

  ListItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
