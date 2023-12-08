import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Section 1: Featured Event
          _buildFeaturedEventCard(),

          SizedBox(height: 16),

          // Section 2: Upcoming Events
          _buildUpcomingEventsSection(),

          SizedBox(height: 16),

          // Section 3: Animated Countdown Timer
          _buildCountdownTimerSection(),

          SizedBox(height: 16),

          // Section 4: Event with Map
          _buildEventWithMapSection(),

          SizedBox(height: 16),

          // Section 5: Interactive Event
          _buildInteractiveEventSection(),
        ],
      ),
    );
  }

  // Feature 1: Featured Event Card
  Widget _buildFeaturedEventCard() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Text(
            'Football Championship',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: January 1, 2023', style: TextStyle(color: Colors.white)),
              Text('Time: 3:00 PM', style: TextStyle(color: Colors.white)),
              Text('Location: Stadium XYZ', style: TextStyle(color: Colors.white)),
            ],
          ),
          onTap: () {
            // Navigate to the detailed event page
          },
        ),
      ),
    );
  }

  // Feature 2: Upcoming Events Section
  Widget _buildUpcomingEventsSection() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          'Upcoming Events',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Basketball Tournament - February 15, 2023'),
            Text('2. Marathon Challenge - March 10, 2023'),
            // Add more upcoming events as needed
          ],
        ),
        onTap: () {
          // Navigate to the upcoming events page
        },
      ),
    );
  }

  // Feature 3: Animated Countdown Timer Section
  Widget _buildCountdownTimerSection() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Countdown Timer',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onTap: () {
                // Navigate to the countdown timer details page
              },
            ),
            SizedBox(height: 16),
            Container(
              height: 127,
              decoration: BoxDecoration(
                color: Colors.blue, // Replace with your desired color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 3 * 24 * 60 * 60 * 1000, // 3 days in milliseconds
                  textStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  onEnd: () {
                    // Handle the end of the countdown
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Feature 4: Event with Map Section
  Widget _buildEventWithMapSection() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          'Run for a Cause',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: April 5, 2023'),
            Text('Time: 8:00 AM'),
            Text('Location: Central Park'),
          ],
        ),
        trailing: Icon(Icons.location_on),
        onTap: () {
          // Navigate to the event location on the map
        },
      ),
    );
  }

  // Feature 5: Interactive Event Section
  Widget _buildInteractiveEventSection() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Interactive Event',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigate to the interactive event details page
            },
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/interactive_event_image.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the button press for interactive engagement
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Join Now', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
