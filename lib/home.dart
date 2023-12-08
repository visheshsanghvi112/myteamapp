import 'package:flutter/material.dart';
import 'DashboardPage.dart';
import 'news.dart';
import 'team.dart';
import 'events.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    DashboardPage(isAdmin: true), // Pass your isAdmin logic here
    NewsPage(),
    TeamPage(),
    EventsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade100,
                Colors.purple.shade800,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add any action you want when the button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple.shade300,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () => _onTabTapped(0),
              color: _currentIndex == 0 ? Colors.purple.shade300 : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.new_releases),
              onPressed: () => _onTabTapped(1),
              color: _currentIndex == 1 ? Colors.purple.shade300 : Colors.grey,
            ),
            SizedBox(), // Empty space for the floating action button
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () => _onTabTapped(2),
              color: _currentIndex == 2 ? Colors.purple.shade300 : Colors.grey,
            ),
            IconButton(
              icon: Icon(Icons.event),
              onPressed: () => _onTabTapped(3),
              color: _currentIndex == 3 ? Colors.purple.shade300 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
