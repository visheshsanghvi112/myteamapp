import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'landing_screen.dart';
import 'eventsignup.dart';
import 'pdf_upload_page.dart';

class DashboardPage extends StatelessWidget {
  final bool isAdmin;

  DashboardPage({required this.isAdmin});

  final List<String> upcomingEvents = ['Football Match - Tomorrow at 3 PM', 'Basketball Tournament - Next Week'];
  final List<String> recentResults = ['Football Match - Won', 'Basketball Tournament - Runner-up'];
  final List<String> newsAndAnnouncements = ['New Coach Announcement', 'Team Meeting - Next Week'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Event Overview'),
            _buildEventOverview(),

            _buildSectionTitle('Registration Section'),
            _buildRegistrationSection(context),

            _buildSectionTitle('Recent Results'),
            _buildRecentResults(),

            _buildSectionTitle('News and Announcements'),
            _buildNewsAndAnnouncements(),

            if (isAdmin) _buildSectionTitle('PDF Upload'),
            if (isAdmin) _buildPdfUploadSection(context),

            // New Feature: Display Weather Information
            _buildSectionTitle('Weather Information'),
            _buildWeatherInformation(),

            // Updated Feature: Social Media Feed with Instagram Icon and Link
            _buildSectionTitle('Social Media Feed'),
            _buildSocialMediaFeed(context),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildEventOverview() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Event ${index + 1}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    upcomingEvents[index],
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRegistrationSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register for Events:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventSignUpPage(eventName: 'Your Event Name')),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'Sign Up for Events',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentResults() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Results:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          for (String result in recentResults)
            Text(
              result,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget _buildNewsAndAnnouncements() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'News and Announcements:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          for (String news in newsAndAnnouncements)
            Text(
              news,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget _buildPdfUploadSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PDF Upload (Admin Only):',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfUploadPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'Upload PDF',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
    );
  }

  // New Feature: Display Weather Information
  Widget _buildWeatherInformation() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Weather:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          // Add weather information widgets here
          // (e.g., temperature, condition, etc.)
          // Placeholder for weather information
          Text(
            'Temperature: 25°C\nCondition: Sunny',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Updated Feature: Social Media Feed with Instagram Icon and Link
  Widget _buildSocialMediaFeed(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Feed:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          // Updated social media feed with Instagram icon and link
          Row(
            children: [
              Image.asset(
                'assets/instagram_icon.png',  // Replace with the actual path to your Instagram icon image
                width: 24,
                height: 24,
                color: Colors.pink,  // Instagram icon color
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  // Replace the placeholder link with your Instagram link
                  // Example: launch('https://www.instagram.com/your_instagram_username/');
                },
                child: Text(
                  'Follow us on Instagram: your_instagram_username',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
